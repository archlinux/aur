# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.4.0
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
sha256sums_x86_64=('0c8f234ad01e3bd0b051e505b09ab88b1c3de34e28a1210da7d05cc50b511c2e')
sha256sums_aarch64=('c26c67a4ed0c6c829e6c04f4675b7f4b7c9d1837704ce8d2d4ed550ae2f97b0c')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
