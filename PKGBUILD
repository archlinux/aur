# Maintainer: sardo <sardonimous@hotmail.com>
pkgname=hintcontrol-bin
pkgver=1.17.1
pkgrel=1
pkgdesc="T-Mobile Home Internet Control"
arch=('x86_64')
url="https://github.com/zacharee/HINTControl"
license=('MIT')
depends=('libxi' 'gcc-libs' 'glibc' 'zlib' 'libx11'  'libxext' 'freetype2' 'libxtst' 'libxrender' 'hicolor-icon-theme' 'java-runtime' 'alsa-lib')
# https://github.com/zacharee/HINTControl/releases/download/1.14.1/hintcontrol_1.14.1_arm64.deb
source=(${url}/releases/download/${pkgver}/hintcontrol_${pkgver}_amd64.deb
	${url}/raw/refs/heads/main/LICENSE)
sha256sums=('1d83ed584d933e1b8557171cd6ba50d85e92d4d9081c785bd1648bddbb4dd28f'
            '2ad4258551f1508d403106e33098acdff4884c3984780b43ce1a8db1dbabe36b')
package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	mkdir -p ${pkgdir}/usr/share/licenses/hintcontrol-bin/
	cp LICENSE ${pkgdir}/usr/share/licenses/hintcontrol-bin/
	rm -r "${pkgdir}/etc" # unneeded apt sources
}

