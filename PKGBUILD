# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder
pkgver=1.14.1
pkgrel=1
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
sha256sums=('862b4790cd80a089c93ad244bbc25706b18d699bf1d8141f353b37a48c56d741')

build() {
        arch-meson pipeline-v$pkgver build
        meson compile -C build
}

package() {
        meson install -C build --destdir "$pkgdir"
}
