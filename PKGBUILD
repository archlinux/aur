# Maintainer: Christopher Snowhill <kode54 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Linux Gamers <linuxgamers@protonmail.com>

pkgname=yuzu-mainline-bin
pkgver=0.1589
_ver=20231015-644cf7eab
pkgrel=1
pkgdesc="Nintendo Switch emulator - mainline branch"
arch=('x86_64')
url="https://github.com/yuzu-emu/yuzu-mainline"
license=('GPL2')
depends=('fuse2' 'libva' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('qt5-wayland: Wayland support')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/mainline-${pkgver/./-}/yuzu-linux-${_ver}.tar.xz"
        "yuzu.svg"
        "yuzu.desktop")
sha512sums=('a64c118635071f530bcbc0dde55aa9032fcf94ac8bf327bc184882fda0bf70c387282e9141c8d8cc8ab1030ac0409ba1f4629e807dae23cd28b1757990d8d69a' 
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '5cb469f178e0a22f249240f8ce26027ba87ebf8b57fd584917c35eb51860a1bc49090d6abaa5d5dc1dded13f78236f15f28cd0e2697f9e509286cb573e1a20c2')

package() {
	install -Dvm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
	install -Dvm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dv yuzu-linux-mainline/yuzu-cmd -t "$pkgdir/usr/bin"
	install -Dv yuzu-linux-mainline/yuzu-mainline.AppImage "$pkgdir/usr/bin/yuzu"
}
