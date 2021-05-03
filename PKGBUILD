# Maintainer: Noah Jelen <noahtjelen@gmail.com>

pkgname=music-lounge-git
pkgver=0.1.2
pkgrel=1
pkgdesc="Yet another music player"
arch=('i686' 'x86_64')
url="https://gitlab.com/aercloud-systems/music-lounge"
license=('GPL')
depends=('ncurses' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('cargo' 'gzip')
source=("git+https://gitlab.com/aercloud-systems/music-lounge")
md5sums=('SKIP')

build() {
    cd "music-lounge"
    cargo build --release
}

package() {
    #the package contents
    cd "music-lounge"
    mkdir -p "$pkgdir/usr/lib/mlounge"
    install -Dt "$pkgdir/usr/bin" -m755 target/release/mlounge
    install -Dt "$pkgdir/usr/share/applications/" mlounge.desktop
    install -Dt "$pkgdir/usr/lib/mlounge/" icon.png
}
