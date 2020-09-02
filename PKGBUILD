
# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-pychromecast6
_name=pychromecast
pkgver=6.0.1
pkgrel=2
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools' 'python-casttube')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/balloob/pychromecast/archive/$pkgver.tar.gz")
sha512sums=('f4b881a559e89d7eb81487ce44c13ac707831a731d348418a78d4786a559abb3c6e98c6b1aa762ad14e5c4461de9a7254ce68c7543bb80e30ce4c3af08d7b24e')
provides=('python-pychromecast')
conflicts=('python-pychromecast')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
