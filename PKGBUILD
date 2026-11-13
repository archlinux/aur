# Maintainer: hyperpuncher
pkgname=stuff-bin
pkgver=0.4.0
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
sha256sums_x86_64=('0bbaab5438b0ffebb2de9a7a5577b815413e4c9b3ee26f9bc196248e2717629c')
sha256sums_aarch64=('7d8c77818faed24b7493098ad8f5e7233067e1460550416c562d47d2a15b0e1f')

package() {
	cd "$srcdir" || return 1
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
