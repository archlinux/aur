# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder
pkgver=1.13.1
pkgrel=2
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
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
sha256sums=('518f11197f57d7b50a499fad4bb3f0bbbe842e1860a89c63f0be5505c454744b')

build() {
        arch-meson pipeline-v$pkgver build
        meson compile -C build
}

package() {
        meson install -C build --destdir "$pkgdir"
}
