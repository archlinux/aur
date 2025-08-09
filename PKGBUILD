# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-docutils
_name=types_docutils
pkgver=0.21.0.20250809
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cc2453c87dc729b5aae499597496e4f69b44aa5fccb27051ed8bb55b0bd5e31b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
