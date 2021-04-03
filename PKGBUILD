# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: György Balló <ballogy at freestart dot hu>

_pkgname=lazr.uri
pkgname=python2-lazr-uri
pkgver=1.0.5
pkgrel=2
pkgdesc="A self-contained, easily reusable library for parsing, manipulating, and generating URIs"
arch=('any')
url="https://launchpad.net/lazr.uri"
license=('LGPL3')
depends=('python2-setuptools')
checkdepends=('python2-pytest')
source=("https://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e3882c6fe2e6f399559195aaa03bcaea')

build() {
    cd lazr.uri-$pkgver
    python2 setup.py build
}

check() {
  cd lazr.uri-$pkgver
  python2 setup.py egg_info
  PYTHONPATH="$PWD:$PWD/src" pytest2
}

package() {
  cd lazr.uri-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
