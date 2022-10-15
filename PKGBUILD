# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Linux Gamers <linuxgamers@protonmail.com>

pkgname=yuzu-mainline-bin
pkgver=0.1200
_ver=20221014-ae6dd1143
pkgrel=1
pkgdesc="Nintendo Switch emulator - mainline branch"
arch=('x86_64')
url="https://github.com/yuzu-emu/yuzu-mainline"
license=('GPL2')
depends=('fuse2' 'libva' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('qt5-wayland: for Wayland support')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu' 'yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-git')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/mainline-${pkgver/./-}/yuzu-linux-${_ver}.tar.xz"
        "yuzu.svg"
        "yuzu.desktop")
sha512sums=('93dd742b099cbb809d6a86d4ad8400b75d6c4010c4c991ec94638062177547ba8917ab25cb44dcaff1861225bf9a47effaca76d72f9dbd5694995681a572be57'
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '5cb469f178e0a22f249240f8ce26027ba87ebf8b57fd584917c35eb51860a1bc49090d6abaa5d5dc1dded13f78236f15f28cd0e2697f9e509286cb573e1a20c2')

package() {
	install -Dm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm755 yuzu-linux-mainline/yuzu-cmd -t "$pkgdir/usr/bin"
	install -Dm755 yuzu-linux-mainline/yuzu-mainline.AppImage "$pkgdir/usr/bin/yuzu"
}
