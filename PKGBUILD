# Contributor: Linux Gamers <linuxgamers@protonmail.com>
_version=20210705-804235fac
pkgname=yuzu-mainline-bin
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
pkgver=0.678
pkgrel=2
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
sha512sums=('b2af9199613b30802e96677871c4a875f29cb7b17400cde15011801fbd0837344414ae48be8956d29dfe3edb55767f74f0fbcb7c21d00a98f57cd7e8a9a94c7f'
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '0b2383b87abbb80a26a7926b5b64121ec0399832aee474ebfdb9f2b001fee6cf4b90d0a8625028f05273e95e2c94f692291a98d769fac5a1f2ad598e168811a1')
package() {
    install -Dm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm755 yuzu-linux-${_version}/yuzu{,-cmd} -t "$pkgdir/usr/bin"
}
