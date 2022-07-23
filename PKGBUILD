# Contributor: Linux Gamers <linuxgamers@protonmail.com>
_version=20220723-eb14b2edf
pkgname=yuzu-mainline-bin
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu' 'yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
pkgver=0.1105
pkgrel=1
pkgdesc="Nintendo Switch emulator - mainline branch"
arch=('x86_64')
url="https://github.com/yuzu-emu/yuzu-mainline"
license=('GPL2')
depends=('qt5-base' 'opus' 'hicolor-icon-theme')
optdepends=('qt5-wayland: for Wayland support')
source=("${url}/releases/download/mainline-${pkgver/./-}/yuzu-linux-${_version}.tar.xz"
        # icon and desktop from upstream not included in sources
        "yuzu.svg"
        "yuzu.desktop")
sha512sums=('0bbee491225afc5ea0c0886900424361bb6befa260bd97249638381293ba32a4a75bb4271e364a1aa378bc8ef57ab3b6a6acbadf005dbe28c50a68794243f9b5'
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '5cb469f178e0a22f249240f8ce26027ba87ebf8b57fd584917c35eb51860a1bc49090d6abaa5d5dc1dded13f78236f15f28cd0e2697f9e509286cb573e1a20c2')
package() {
    install -Dm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm755 yuzu-linux-${_version}/yuzu{,-cmd} -t "$pkgdir/usr/bin"
}
