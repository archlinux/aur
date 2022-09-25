# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Linux Gamers <linuxgamers@protonmail.com>

pkgname=yuzu-mainline-bin
pkgver=0.1180
_ver=20220925-37c4a689e
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
sha512sums=('f4f78d50070389c7a912aea610c7cdb684128e838255ddb0273041e6f0fe51f003760df39fe590d8b2e2d2713dc1a735953f16d826f9ba61a03fa7154770174c'
            '8e9f442436bd5f89a99c902960b51a3dd124ba17119422cca1ae792da0bcf3c757862bc88cb3d229b1f6a3b8b36c73f47f2c7266a11f91ebb38265777a2ba6b3'
            '5cb469f178e0a22f249240f8ce26027ba87ebf8b57fd584917c35eb51860a1bc49090d6abaa5d5dc1dded13f78236f15f28cd0e2697f9e509286cb573e1a20c2')

package() {
	install -Dm644 yuzu.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 yuzu.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm755 yuzu-linux-mainline/yuzu-cmd -t "$pkgdir/usr/bin"
	install -Dm755 yuzu-linux-mainline/yuzu-mainline.AppImage "$pkgdir/usr/bin/yuzu"
}
