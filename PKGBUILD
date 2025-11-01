# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=nova-music-git
pkgver=0.1.0_47b7156
pkgrel=3
pkgdesc="A music player written in the libcosmic toolkit"
arch=('any')
options=('!emptydirs')
url="https://github.com/lunarsrl/NovaMusic"
license=('GPL-2.0-or-later')
makedepends=(just rust) # hah, "just rust"...
depends=()

source=('git+https://github.com/lunarsrl/NovaMusic.git#branch=main')
sha512sums=(SKIP)

build() {
    cd "$srcdir"/NovaMusic
    just
}

package() {
    cd "$srcdir"/NovaMusic
    mkdir -p "$pkgdir"/usr/bin/
    mkdir -p "$pkgdir"/usr/share/{applications,icons}
    install ./target/release/nova-music "$pkgdir"/usr/bin/
    install -m 644 ./resources/app.desktop "$pkgdir"/usr/share/applications/nova-music.desktop
    install -m 644 ./resources/icons/hicolor/scalable/apps/icon.svg "$pkgdir"/usr/share/icons/dev.riveroluna.NovaMusic.svg
}
