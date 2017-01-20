# Maintainer: Elrondo46 <elrond94@hotmail.com>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

# NVIDIA Video Codec SDK

pkgname=nvidia-sdk-manjaro
pkgver=7.1.9
pkgrel=1
pkgdesc="NVIDIA Video Codec SDK (NVENCODE API and NVDECODE API)"
arch=('i686' 'x86_64')
url="https://developer.nvidia.com/nvidia-video-codec-sdk/"
license=('custom')
source=('https://github.com/Elrondo46/nvidia-sdk-manjaro/raw/master/Video_Codec_SDK_7.1.9.zip')
sha256sums=('SKIP')

package() {
	mkdir -p "${pkgdir}/usr/include/${pkgname}"
	mkdir -p "${pkgdir}/usr/include/${pkgname}/GL"
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	
	# Includes
	cd "${srcdir}/Video_Codec_SDK_${pkgver}/Samples/common/inc"
	install -D -m644 *.h      "${pkgdir}/usr/include/${pkgname}"
	install -D -m644 ./GL/*.h "${pkgdir}/usr/include/${pkgname}/GL"
	
	# Lib
	cd "${srcdir}/Video_Codec_SDK_${pkgver}/Samples/common/lib/linux/${CARCH}"
	install -D -m644 libGLEW.a "${pkgdir}/usr/lib/${pkgname}/libGLEW.a"
	
	# Documentation
	cd "${srcdir}/Video_Codec_SDK_${pkgver}/doc"
	install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
	
}
