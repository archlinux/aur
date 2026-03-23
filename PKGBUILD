# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=babblecalibration-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Godot-based OpenVR/OpenXR eye tracking calibrator app"
arch=('x86_64' 'aarch64')
url="https://github.com/Project-Babble/BabbleCalibration"
license=('LicenseRef-Babble Software Distribution License 1.0')

makedepends=(
    unzip
)
#depends=(
#)

source_x86_64=(
    "BabbleCalibration_${pkgver}.zip::${url}/releases/download/${pkgver}/Linux.zip"
    "LICENSE"
)
source_aarch64=(
    "BabbleCalibration-ARM_${pkgver}.zip::${url}/releases/download/${pkgver}/Linux-ARM.zip"
    "LICENSE"
)
sha256sums_x86_64=('e3eabae9efbb09c0471834a35e323dd886293fe890f2e3f846d851315c42b917'
                   '88bec1dde0ff33748c5fe396905e8db3ca7f6c6788c27b070147d18d5af94c99')
sha256sums_aarch64=('5aea7bda5d09ab4f32240a118c97f01ebc955ee2fd62d3b7f52b4336cf3c260a'
                    '88bec1dde0ff33748c5fe396905e8db3ca7f6c6788c27b070147d18d5af94c99')
noextract=(
    "BabbleCalibration_${pkgver}.zip"
    "BabbleCalibration-ARM_${pkgver}.zip"
)
package() {
    install -d "${pkgdir}/opt/babblecalibration/"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/babblecalibration/LICENSE"

    unzip "${srcdir}/BabbleCalibration*_${pkgver}.zip" -d "${pkgdir}/opt/babblecalibration/"
}
