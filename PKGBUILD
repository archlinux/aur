# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Linux Gamers <linuxgamers@protonmail.com>

pkgname=yuzu-mainline-bin
pkgver=0.1329
_ver=20230204-9dc81299b
pkgrel=1
pkgdesc="Nintendo Switch emulator - mainline branch"
arch=('x86_64')
url="https://github.com/yuzu-emu/yuzu-mainline"
license=('GPL2')
depends=('fuse2' 'libva' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('qt5-wayland: Wayland support')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu' 'yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/mainline-${pkgver/./-}/yuzu-linux-${_ver}.tar.xz"
        "yuzu.svg"
        "yuzu.desktop")
sha512sums=('a1486bd37450e628746f8a962667b6d558c6d14239bdf60ca5364b8d13494fe79a13efdd5c22071ae3db937a110b53dd01bc4be5b55b79f96ece30e3f64cb174'
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '5cb469f178e0a22f249240f8ce26027ba87ebf8b57fd584917c35eb51860a1bc49090d6abaa5d5dc1dded13f78236f15f28cd0e2697f9e509286cb573e1a20c2')

package() {
	install -Dvm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
	install -Dvm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dv yuzu-linux-mainline/yuzu-cmd -t "$pkgdir/usr/bin"
	install -Dv yuzu-linux-mainline/yuzu-mainline.AppImage "$pkgdir/usr/bin/yuzu"
}
