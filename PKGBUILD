# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=linux-vr-player-or-something-git
pkgver=3.ac25eda
pkgrel=1
pkgdesc="Very simple VR video player using libmpv and openhmd."
arch=(i686 x86_64)
url="https://github.com/sandsmark/linux-vr-player-or-something"
license=(GPL3)
depends=(qt5-base mpv openhmd)
makedepends=(git)
provides=(linux-vr-player-or-something)
conflicts=(linux-vr-player-or-something)
source=('git+https://github.com/sandsmark/linux-vr-player-or-something.git')
md5sums=('SKIP')

pkgver() {
    cd linux-vr-player-or-something
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd linux-vr-player-or-something
    qmake
    make
}

package() {
    cd linux-vr-player-or-something
    install -Dm755 ohmdplayer "$pkgdir/usr/bin/ohmdplayer"
}
