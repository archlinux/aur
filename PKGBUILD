# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='lightweight native Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/spoti'
license=('MIT AND Zlib AND ISC AND OFL-1.1 AND Unicode-3.0')
depends=('curl' 'fontconfig' 'glib2' 'glibc' 'hicolor-icon-theme'
	'libsecret' 'libvorbis' 'libwebp' 'sdl3' 'sdl3_ttf'
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
sha256sums_x86_64=('c390cd0f3d07580a0895a5e84058a933c4facb9466c4a366a1976188e4d8fad4')
sha256sums_aarch64=('b0fe9f890e795e4fe7020cedbff12c79fd089b2c69b51a98042a6d17c56880b5')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
