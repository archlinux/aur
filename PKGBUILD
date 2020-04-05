# Maintainer: Yui Yukihira <yuiyukihira at pm dot me>
pkgname=photonfilevalidator
pkgrel=1
pkgver=2.1
pkgdesc="A file viewer application for AnyCubic Photon sliced files (*.photon and *.cbddlp)"
url="https://github.com/Photonsters/PhotonFileValidator"
provides=("photonfilevalidator")
arch=('any')
license=('MIT')
depends=('java-runtime' 'bash')
makedepends=()
backup=()
source=(
    "jar-${pkgname}-${pkgver}.zip::https://github.com/Photonsters/PhotonFileValidator/releases/download/${pkgver}/jar-${pkgname}-${pkgver}.zip"
    "PhotonFileValidator.desktop"
    "photonfilevalidator.sh"
    "LICENSE::https://raw.githubusercontent.com/Photonsters/PhotonFileValidator/master/LICENSE"
    "photonfilevalidator.png::https://raw.githubusercontent.com/Photonsters/PhotonFileValidator/master/install/img/logos/validatorlogo.png"
)
sha256sums=(
    "0062c57146229f4f8d859fa25b0e77b74a20e4d5bdefde373b01e6ce9d2a2d69"
    "99feda168e7e9accacbb22045f39c4fae3ee593070e2b3641ee5805030096a79"
    "6271cecb92b4c73813902027a50a6f21e14ba692831c8ea55ea0cdec534822c0"
    "f309e209cdaa89de5557f3d02747eeef91a3504566e7ba172564ef0dd3c0df52"
    "75e1b1c37e587f853f89ed1384e3c38bf34917b7b65108634e84fba99b1cd53c"
)
package() {
    install -d "$pkgdir"/usr/share/java/photonfilevalidator

    install -D -m644 "$srcdir"/PhotonFileValidator.jar "${pkgdir}/usr/share/java/photonfilevalidator/PhotonFileValidator.jar"

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./photonfilevalidator.sh" "${pkgdir}/usr/bin/photonfilevalidator"
    install -D -m644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "./PhotonFileValidator.desktop" "${pkgdir}/usr/share/applications/PhotonFileValidator.desktop"
    install -D -m644 "./photonfilevalidator.png" "${pkgdir}/usr/share/pixmaps/photonfilevalidator.png"
}
