# Maintainer: hyperpuncher
pkgname=stuff-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='lightweight file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/stuff'
license=('MIT AND Zlib AND ISC')
depends=('dbus' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'libarchive' 'sdl3'
	'sdl3_image' 'sdl3_ttf' 'systemd-libs' 'ttf-font' 'udisks2' 'wayland' 'xdg-utils')
optdepends=('polkit-agent: authentication prompts for protected storage operations'
	'xdg-desktop-portal: application chooser and desktop font settings')
provides=("stuff=$pkgver")
conflicts=('stuff')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.zst::$url/releases/download/v$pkgver/stuff-linux-x64.tar.zst")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.zst::$url/releases/download/v$pkgver/stuff-linux-arm64.tar.zst")
sha256sums_x86_64=('540b6dbfa8c645b18e99ab0c4b95d4ac4ba147dfb546f486601f31d4a9fc56a3')
sha256sums_aarch64=('8190bf02257c3e2fa3eed833ddea3fe8d6ef96ee0e1684f3440e47e131a3bf48')

package() {
	cd "$srcdir" || return 1
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
