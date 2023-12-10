# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder
pkgver=1.14.2
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
sha256sums=('dfb5cfce43da6d4471bdae0bcbd58799fcc7b686061eebe9686809a6d4b80d00')

build() {
        arch-meson pipeline-v$pkgver build
        meson compile -C build
}

package() {
        meson install -C build --destdir "$pkgdir"
}
