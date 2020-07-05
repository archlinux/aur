# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# You need to download the SDK file from NVIDIA's website (registration required)
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgname=nvidia-sdk
pkgver=10.0.26
pkgrel=1
pkgdesc='NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (needs registration at upstream URL and manual download)'
arch=('any')
url='https://developer.nvidia.com/nvidia-video-codec-sdk/'
license=('custom')
makedepends=('poppler')
source=("local://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('67ff4543f93ad8ec1bc4ce2ef653b0778b94652597da9762a6e08f442dad5f45')

prepare() {
    pdftotext -layout "Video_Codec_SDK_${pkgver}/LicenseAgreement.pdf"
}

package() {
    install -D -m644 "Video_Codec_SDK_${pkgver}/Interface/nvEncodeAPI.h" -t "${pkgdir}/usr/include/${pkgname}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/Interface/cuviddec.h" -t "${pkgdir}/usr/include/${pkgname}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/Interface/nvcuvid.h" -t "${pkgdir}/usr/include/${pkgname}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/Doc"/* -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
