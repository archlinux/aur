# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=pdfbox-preflight
pkgver=3.0.1
pkgrel=1
pkgdesc="Java tool that implements a parser compliant with PDF/A-1"
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
_jarname=${pkgname}-app-${pkgver}.jar
noextract=(pdfbox-preflight.jar)

source=(pdfbox-preflight
        pdfbox-preflight.jar::https://dlcdn.apache.org/pdfbox/${pkgver}/preflight-app-${pkgver}.jar)

sha512sums=('09661b2feca954b58677274063e71a55ee396505a8b0d392fa419e774cf47efa1ee98ffc45eeff7d3484afbc87458a22eed6c496c5a510fb54b2e73484d241f5'
            '8f24ef587b31f33198051e5d06205ad7b8c155fdf949939d2892eb3e5678963cc47bb2a92cec4e05aa4ebec10ca77e3a34e0038d548e222486bf275bd68f9516')

package() {
    cd "${srcdir}"

    install -D -m755 "pdfbox-preflight" "${pkgdir}/usr/bin/pdfbox-preflight"

    install -D -m644 "pdfbox-preflight.jar" "${pkgdir}/usr/share/pdfbox/pdfbox-preflight.jar"
}

