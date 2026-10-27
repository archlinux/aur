# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='lightweight native Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/spoti'
license=('MIT AND Zlib AND ISC AND OFL-1.1 AND Unicode-3.0')
depends=('curl' 'fontconfig' 'glib2' 'glibc' 'hicolor-icon-theme'
	'libsecret' 'sdl3' 'sdl3_image' 'sdl3_ttf'
	'systemd-libs' 'xdg-utils')
optdepends=('noto-fonts: additional script and symbol coverage'
	'noto-fonts-cjk: CJK characters'
	'noto-fonts-emoji: color emoji'
	'org.freedesktop.secrets: save login credentials')
provides=("spoti=$pkgver")
conflicts=('spoti')
options=('!strip')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.zst::$url/releases/download/v$pkgver/spoti-linux-x64.tar.zst")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.zst::$url/releases/download/v$pkgver/spoti-linux-arm64.tar.zst")
sha256sums_x86_64=('de32d432d7ff5b61dec20b5acea74dac8329a2c8cc39d43266fececdc3982e1a')
sha256sums_aarch64=('082dbd017b55ff52dd606f8069f96d599e4df423996fb736dfb8e2cccaa865c6')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
