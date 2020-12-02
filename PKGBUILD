# Maintainer: Dries007 <admin@dries007.net>
pkgname=ykush
pkgver=1.2.5
pkgrel=1
pkgdesc="Yepkit Boards Control Application"
arch=('any')
url="https://github.com/Yepkit/ykush"
license=('Apache')
depends=(
    'libusb'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Yepkit/ykush/archive/${pkgver}.tar.gz")
sha256sums=('ccdffc34308c24fbf370ee86cec3ae74df4430f5606d447e9a63310bc676aa62')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make ykushcmd
}

package() {
    # The provided install script just does a "sudo cp". I think we can do better.
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install bin/ykushcmd "$pkgdir/usr/bin"
}
