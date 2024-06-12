# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="stirling-pdf"
pkgname="${_pkgname}-bin"
pkgver=0.26.0
pkgrel=1
pkgdesc="Locally hosted web application that allows you to perform various operations on PDF files"
arch=("any")
url="https://github.com/Stirling-Tools/Stirling-PDF"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("GPL-3.0-or-later")
backup=("etc/${_pkgname}/${_pkgname}.env")
depends=("java-runtime-headless>=17" "libreoffice-fresh" "ocrmypdf" "pngquant" "python-opencv" "tesseract-data-eng" "unoconv" "unpaper")
optdepends=("jbig2enc: for certain OCR functionality"
            "tesseract-data-<langs_code>: for certain language OCR"
            "tesseract-data: for all language OCR")
source=("${_pkgname}.jar::${url}/releases/download/v${pkgver}/Stirling-PDF-with-login.jar"
        "${_pkgname}.env"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('1c464ea1c80cc51776cb470c5bcc479c839e2a8a792a4a6606e1de5be5222121'
            'e42cd1b7f960be61c93a141084002c8a8a0dc832a437b1e4b4a21004dfe4243d'
            '2bb657dff015c992782eddfd036cc001c105bb57e052e8b2fe3f80161a450070'
            '0f8b3d727955536ae3ed98e8aeccb8f073e4c97c36a95de595624a71ea5fdd11'
            '554fbc114c32f4b81fe3b8199e936881e26b5649098c495acfd4cd77eefd2612')

package() {
    install -Dm644 "${_pkgname}.jar"      "${pkgdir}/usr/share/java/${_pkgname}.jar"
    install -Dm644 "${_pkgname}.env"      "${pkgdir}/etc/${_pkgname}/${_pkgname}.env"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
