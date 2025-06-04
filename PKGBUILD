# Maintainer: impulse <james@jamesdavidclarke.com> 
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de

pkgname=tika
pkgver=3.2.0
pkgrel=2
pkgdesc="Detects and extracts metadata and text from over a thousand different file types, such as PPT, XLS, and PDF. (desktop)"
arch=('any')
url="https://${pkgname}.apache.org"
license=('Apache-2.0')
depends=('java-runtime-headless')
optdepends=('tesseract: OCR support' 'sox: Audio support' 'ffmpeg: Video support' 'perl-image-exiftool: EXIF Metadata support')
source=("${pkgname}-${pkgver}.jar::https://dlcdn.apache.org/${pkgname}/${pkgver}/${pkgname}-app-${pkgver}.jar"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}.svg")
sha256sums=('1056397a40cefbb45952a379075c54b7f8dff244d4ad5ec3c785d8a110d4f533'
            '7ee34098c9cd2a62589c86b08a39199e7e51243e8a8f8b3cc0b5135ad10ed3b0'
            '731db35413b27db83915fe674c0e7094f198ab4ff2fa3a7707884dbad3f2ec1e'
            'ccae8a7ff8b30e73511e11f5c33facbf87d7e47db8cc86e14a52116ac96da9b7')
noextract=("${pkgname}-${pkgver}.jar")

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
    install -Dm644 "${pkgname}.desktop"       "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}.sh"            "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.svg"           "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
