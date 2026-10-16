# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='lightweight native Spotify client'
arch=('x86_64')
url='https://github.com/hyperpuncher/spoti'
license=('MIT AND Zlib AND ISC AND OFL-1.1 AND Unicode-3.0')
depends=('curl>=7.86' 'fontconfig' 'glib2' 'glibc' 'hicolor-icon-theme'
	'libsecret' 'libvorbis' 'libwebp' 'sdl3>=3.4' 'sdl3_ttf>=3.2.2'
	'systemd-libs' 'xdg-utils')
optdepends=('noto-fonts: additional script and symbol coverage'
	'noto-fonts-cjk: CJK characters'
	'noto-fonts-emoji: color emoji'
	'org.freedesktop.secrets: save login credentials')
provides=("spoti=$pkgver")
conflicts=('spoti')
options=('!strip')
source=("$pkgname-$pkgver-$CARCH.tar.zst::$url/releases/download/v$pkgver/spoti-linux-x64.tar.zst")
sha256sums=('6082483e9d82312c0db0b53ffc2042e3142bb658cdd388f0a678c5fae2ef42cb')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
