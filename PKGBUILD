# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=python-epub_meta
_proj_name="${pkgname#python-}"
pkgver='0.0.7'
pkgrel=1
pkgdesc='Small library to read metadata from ePub 2 and 3 files'
arch=(any)
url="https://github.com/paulocheque/epub-meta"
license=('MIT')
depends=('python')
optdepends=()
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
_src_url="https://files.pythonhosted.org/packages/source/"
_src_url="${_src_url}${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz"
source=("$_src_url")
sha256sums=('9d9c6afeaef796105a77d0aef33a1c943ccd91cccb2cb7716f59ad149819a4e9')
_tardir="${_proj_name}-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
