# Maintainer: Danila Vershinin <ciapnz@gmail.com>
pkgname=gixy-ng
_pyname=gixy_ng
pkgver=0.2.63
pkgrel=1
pkgdesc="NGINX configuration static analyzer focused on security (maintained fork of yandex/gixy)"
arch=('any')
url="https://gixy.getpagespeed.com/"
license=('MPL-2.0')
depends=('python' 'python-ngxparse' 'python-jinja' 'python-configargparse')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-rich: prettier terminal output')
provides=('gixy')
conflicts=('gixy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('ccff12aa3fdda85e125d7540aa4b51219ed7ab7e59adbafafffb47d6e4b348a5')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
