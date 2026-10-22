# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.4.1
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
sha256sums_x86_64=('bbe434e46ec480635bb0dab7219c209034ad32da0ea3897759727798970c7b05')
sha256sums_aarch64=('5f17ab5054e51205141fed76929365ebd19d538a30eaca02a0be89f4b6a76ac4')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
