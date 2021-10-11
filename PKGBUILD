# Contributor: Linux Gamers <linuxgamers@protonmail.com>
_version=20211011-d5cc9c3e8
pkgname=yuzu-mainline-bin
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
pkgver=0.776
pkgrel=1
pkgdesc="Nintendo Switch emulator - mainline branch"
arch=('x86_64')
url="https://github.com/yuzu-emu/yuzu-mainline"
license=('GPL2')
depends=('qt5-base' 'ffmpeg')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/releases/download/mainline-${pkgver/./-}/yuzu-linux-${_version}.tar.xz"
        # icon and desktop from upstream not included in sources
        "yuzu.svg"
        "yuzu.desktop")
sha512sums=('d3a1f7a9a9168f65438feea11d4b65ce1f4db1d1770e1e81c5b140c666315b38e503e2cf13e06d5d0223d4fb6490233f5dee611a564d8ed6d656a8ffab1ba471'
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '0b2383b87abbb80a26a7926b5b64121ec0399832aee474ebfdb9f2b001fee6cf4b90d0a8625028f05273e95e2c94f692291a98d769fac5a1f2ad598e168811a1')
package() {
    install -Dm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm755 yuzu-linux-${_version}/yuzu{,-cmd} -t "$pkgdir/usr/bin"
}
