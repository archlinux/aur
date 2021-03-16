# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-derpconf
_name=${pkgname#python-}
pkgver=0.8.3
pkgrel=1
pkgdesc="abstract loading of configuration files"
arch=('any')
url="https://github.com/globocom/derpconf"
license=('MIT')
depends=(python)
makedepends=('python-setuptools')
source=("https://github.com/globocom/derpconf/archive/v$pkgver.tar.gz")
b2sums=('b1ab949f512314a57d5708eb7b7ed9b642207060207c3e68035ddd21c21a40b44cf44b28b7a0a27a6d1dbe4147603135339de03d3c7ec4936eb7c30399570bd6')

build() {
    cd $_name-$pkgver

    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

