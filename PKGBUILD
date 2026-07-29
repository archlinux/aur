# Maintainer: zaidejjo <zaid@ejjo.me>
# Contributor: zaidejjo <zaid@ejjo.me>
# shellcheck shell=bash

pkgname=zgit-desktop-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A modern, fast Git & GitHub client — Desktop app (Wails)"
arch=('x86_64')
url="https://github.com/zaidejjo/zgit"
license=('Apache')
depends=('git' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/zgit-desktop-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('6e3ac48d2b10cbe27eff5c469747cda3713ac8854317aea7959cf7c85d802497')

package() {
    # Install binary dynamically using $pkgver
    install -Dm755 "zgit-desktop-v${pkgver}-linux-amd64" "$pkgdir/usr/bin/zgit-desktop"

    # Install desktop integration files
    install -Dm644 zgit.png "$pkgdir/usr/share/pixmaps/zgit.png"
    install -Dm644 zgit.desktop "$pkgdir/usr/share/applications/zgit.desktop"
    install -Dm644 com.zaidejjo.zgit.metainfo.xml "$pkgdir/usr/share/metainfo/com.zaidejjo.zgit.metainfo.xml"
}

# vim:set ts=2 sw=2 et:
