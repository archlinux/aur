# Maintainer: TTsdzb <ttsdzb at outlook dot com>
pkgname=scrcpy-mask-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A Scrcpy client in Rust & Tarui aimed at providing mouse and key mapping to control Android device, similar to a game emulator."
arch=('x86_64')
url="https://github.com/AkiChase/scrcpy-mask"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'scrcpy')
provides=('scrcpy-mask')
source=("${pkgname}-${pkgver}.deb::https://github.com/AkiChase/scrcpy-mask/releases/download/v${pkgver}/scrcpy-mask_${pkgver}_amd64.deb")
sha256sums=('18706f994cd49e92b5ef0cf23b25043448e82dcdde6fe8e091b19234b42942b9')

prepare() {
	rm -rf data
	mkdir data
	bsdtar -x -f data.tar.gz -C data
}

package() {
	cp -a ${srcdir}/data/* ${pkgdir}/
}
