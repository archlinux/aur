# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder
pkgver=1.9.0
pkgrel=1
pkgdesc="A Youtube, Lbry and Peertube client made for the Pinephone"
arch=('x86_64' 'aarch64')
url="https://www.tubefeeder.de"
license=('GPL')
groups=()
depends=('libadwaita')
optdepends=('mpv: Play the videos', 'youtube-dl: Play and download the videos')
makedepends=('cargo' 'meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("$pkgname.tar.xz::https://github.com/Tubefeeder/Tubefeeder/releases/download/v$pkgver/tubefeeder-$pkgver.tar.xz")
noextract=()
md5sums=('1d88e8e4d78fbf061dd811833df24fbc')

build() {
        arch-meson $pkgname-$pkgver build
        meson compile -C build
}

package() {
        meson install -C build --destdir "$pkgdir"
}
