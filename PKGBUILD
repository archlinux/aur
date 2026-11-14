# Maintainer: Danila Vershinin <ciapnz@gmail.com>
pkgname=gixy-ng
_pyname=gixy_ng
pkgver=0.2.62
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
sha256sums=('c0e2e82619ba26941c0c82407f886e3b888ad5b08e138b3685108b5448690a13')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
