# Maintainer: luke bonham <dada [at] archlinux [dot] info>

pkgname=awesome-freedesktop-git
pkgcom=105
pkgsha=6951b09
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Freedesktop.org menu and desktop icons support for Awesome WM"
arch=("any")
url="https://github.com/lcpz/awesome-freedesktop"
license=("GPL2")
depends=("awesome")
makedepends=("git")
provides=("awesome-freedesktop")
conflicts=("awesome-freedesktop")
sha256sums=("SKIP")
source=("awesome-freedesktop-${pkgver}.zip::https://github.com/lcpz/awesome-freedesktop/archive/$pkgsha.zip")

prepare() {
    mv "awesome-freedesktop-$pkgsha"* freedesktop
}

package() {
    # check if awesome is stable or git
    if [ -d "/usr/share/awesome/lib/" ]; then
        aw_path="$pkgdir/usr/share/awesome/lib"
    else
        aw_path="$pkgdir/usr/local/share/awesome/lib"
    fi

    install -dm755 "$aw_path/freedesktop"
    cp -a freedesktop $aw_path
}
