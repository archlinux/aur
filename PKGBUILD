# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='lightweight native Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/spoti'
license=('MIT AND Zlib AND ISC AND OFL-1.1 AND Unicode-3.0')
depends=('curl' 'cairo' 'pango>=1.56' 'glib2' 'glibc' 'hicolor-icon-theme'
	'libsecret' 'sdl3' 'sdl3_image'
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
sha256sums_x86_64=('74369789157375a5c6ff30c1a949c4798dd77254a57dcca4f4f9f33ad2b4749f')
sha256sums_aarch64=('94c8ee87555a006daf70e937816598efa6359b5b3b300093d3981e25089dbe8e')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
