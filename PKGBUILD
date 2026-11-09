# Maintainer: hyperpuncher
pkgname=stuff-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='lightweight file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/stuff'
license=('MIT AND Zlib AND ISC')
depends=('dbus' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'sdl3'
	'sdl3_image' 'sdl3_ttf' 'systemd-libs' 'ttf-font' 'udisks2' 'wayland' 'xdg-utils')
optdepends=('polkit-agent: authentication prompts for protected storage operations'
	'xdg-desktop-portal: application chooser and desktop font settings')
provides=("stuff=$pkgver")
conflicts=('stuff')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.zst::$url/releases/download/v$pkgver/stuff-linux-x64.tar.zst")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.zst::$url/releases/download/v$pkgver/stuff-linux-arm64.tar.zst")
sha256sums_x86_64=('fa822f2f219ed48b906bf3e98fd4c85283272833a1ef95a50ad5a5e59493ceb9')
sha256sums_aarch64=('b2a466ccc9d68fc8dd561efcc75df05f863b645be7644d0052441ebb22ce5126')

package() {
	cd "$srcdir" || return 1
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
