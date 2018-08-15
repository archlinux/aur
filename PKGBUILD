# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-mtgsdk
pkgver=1.3.0
pkgrel=1
pkgdesc='Magic: The Gathering SDK Python implementation. It is a wrapper around the MTG API of magicthegathering.io.'
arch=('any')
url="https://github.com/MagicTheGathering/mtg-sdk-python"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('429f2205bef7d406d798dc0fd8ecbdee099c085216be25883e1039fe56f43062')


build() {
    cd $srcdir/mtg-sdk-python-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/mtg-sdk-python-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

