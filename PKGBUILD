# Maintainer: Shimi Chen <shimi.chen@gmail.com>

pkgname=preflight-app
pkgver=2.0.13
pkgrel=1
pkgdesc="Validate PDF files against the PDF/A-1b standard."
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
jarname=${pkgname}-${pkgver}.jar
noextract=($jarname)

source=(preflight-app
        http://mirror.netcologne.de/apache.org/pdfbox/${pkgver}/${jarname})

sha1sums=('0090ad58d90ca109f72808b8279452e9197d94b9'
          '27052fe03cac6774ea50703c08b42678d23a0122')

package() {
    cd "${srcdir}"

    install -D -m755 "${srcdir}/preflight-app"   "${pkgdir}/usr/bin/preflight-app"
    install -D -m644 "${srcdir}/${jarname}" "${pkgdir}/usr/share/java/preflight-app/preflight-app.jar"
}

