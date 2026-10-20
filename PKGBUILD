# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.3.1
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
sha256sums_x86_64=('a9ba1c6e0d3e9e92aa3946661f16b3a9465cba8c911754fd7eb4abedb6d21371')
sha256sums_aarch64=('5056b3c85f6a69d8a0aa720160cec5670db0d06853c8f25eebef9a3722f6b9ab')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
