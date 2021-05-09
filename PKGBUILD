# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-git
pkgver=r102.5da2ac1
pkgrel=1
pkgdesc="Customize colors on Wooting Keyboard #WootDev"
arch=('any')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL2')
depends=('libusb')
makedepends=('git' 'hidapi' 'libusb')
provides=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname/linux"

    CFLAGS+=" -fPIC" prefix="$pkgdir/usr" make install
}
