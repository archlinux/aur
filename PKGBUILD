# Maintainer: sardo <sardonimous@hotmail.com>
pkgname=hintcontrol-bin
pkgver=1.14
pkgrel=1
pkgdesc="T-Mobile Home Internet Control"
arch=('x86_64')
url="https://github.com/zacharee/HINTControl"
license=('MIT')
depends=('libxi' 'gcc-libs' 'glibc' 'zlib' 'libx11'  'libxext' 'freetype2' 'libxtst' 'libxrender' 'hicolor-icon-theme' 'java-runtime' 'alsa-lib')
# https://github.com/zacharee/HINTControl/releases/download/1.14.1/hintcontrol_1.14.1_arm64.deb
source=(${url}/releases/download/${pkgver}.${pkgrel}/hintcontrol_${pkgver}.${pkgrel}_amd64.deb
	${url}/raw/refs/heads/main/LICENSE)
sha256sums=('3e6b7818c1b8ab761a11df1d47782638dd24b2a79beb6fd1edff5faf5b470f86'
            '2ad4258551f1508d403106e33098acdff4884c3984780b43ce1a8db1dbabe36b')
package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	mkdir -p ${pkgdir}/usr/share/licenses/hintcontrol/
	cp LICENSE ${pkgdir}/usr/share/licenses/hintcontrol/
	rm -r "${pkgdir}/etc" # unneeded apt sources
}

