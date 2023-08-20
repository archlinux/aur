# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder
pkgver=1.13.0
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=('x86_64' 'aarch64')
url="https://mobile.schmidhuberj.de/pipeline"
license=('GPL')
groups=()
depends=('libadwaita')
optdepends=('mpv: Play the videos', 'youtube-dl: Play and download the videos')
makedepends=('rust' 'meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/v$pkgver/pipeline-v$pkgver.tar.gz")
noextract=()
sha256sums=('94a0de0bb0c1d082163b77ebb6a7ab75834f3d57b3e990bcb92e02fe931fd0ef')

build() {
        arch-meson $pkgname-$pkgver build
        meson compile -C build
}

package() {
        meson install -C build --destdir "$pkgdir"
}
