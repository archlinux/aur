# Maintainer: hyperpuncher
pkgname=stuff-bin
pkgver=0.5.0
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
sha256sums_x86_64=('59c38089a84995cf1d5e056439b50ceb7d0fba694611af81bfceb9f4cbfcbf66')
sha256sums_aarch64=('bfdfcc23334c545fcde4495602761c04204651828c771e21b2cc7bf60c17168d')

package() {
	cd "$srcdir" || return 1
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
