# Maintainer: Luca CPZ <luca.cpz [at] gmail [dot] com>

pkgname=lain-git
pkgcom=1697
pkgsha=3328e73
pkgver=$pkgcom.$pkgsha
pkgrel=2
pkgdesc="Layouts, asynchronous widgets and utilities for Awesome WM"
arch=("any")
url="https://github.com/lcpz/lain"
license=("GPL2")
depends=("awesome")
optdepends=("curl: for IMAP, MPD and weather widgets")
provides=("lain")
conflicts=("lain")
sha256sums=("SKIP")
source=("lain-${pkgver}.zip::https://github.com/lcpz/lain/archive/$pkgsha.zip")

prepare() {
    mv "lain-$pkgsha"* lain
}

package() {
    # check if awesome is stable or git
    if [ -d "/usr/share/awesome/lib/" ]; then
        aw_path="$pkgdir/usr/share/awesome/lib"
    else
        aw_path="$pkgdir/usr/local/share/awesome/lib"
    fi

    install -dm755 "$aw_path/lain"
    cp -a lain $aw_path
}
