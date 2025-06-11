#!/usr/bin/env bash
# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=osuboot-git
pkgver=r36.131230c
pkgrel=1
pkgdesc="Wrapper for osu!lazer. Downloads and executes the AppImage automatically without requiring any manual work."
arch=("any")
url="https://git.staropensource.de/JeremyStarTM/aur-osuboot-git"
license=("GPL-3.0-or-later")
sha512sums=("SKIP")
source=("git+https://git.staropensource.de/JeremyStarTM/osuboot.git")
depends=("curl"
         "fuse2"
         "iputils"
         "jq"
         "libappimage")
provides=("osuboot"
          "osu")

pkgver() {
    cd "osuboot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "osuboot"
}

build() {
    cd "osuboot"
}

package() {
    cd "osuboot"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm655 osuboot.desktop "${pkgdir}/usr/share/applications/osuboot.desktop"
    install -Dm655 osuboot.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/osu.png"
    install -Dm755 osuboot.sh "${pkgdir}/usr/bin/osuboot"
    install -Dm655 osuboot.xml "${pkgdir}/usr/share/mime/packages/osu.xml"
}
