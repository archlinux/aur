# Maintainer: hyperpuncher
pkgname=spoti-bin
pkgver=0.7.0
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
sha256sums_x86_64=('0f2fd4836890d8fd5c078a230600e6cfd511df504734cd24a10bf5aa23d71b8d')
sha256sums_aarch64=('2ad4f30a09f62083eb21a0d8548e9cabebb07b776853aadd12de8ca006d42ca4')

package() {
	cd "$srcdir"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
