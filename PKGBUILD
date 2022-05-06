# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=pdfbox-preflight
pkgver=2.0.26
pkgrel=1
pkgdesc="Java tool that implements a parser compliant with PDF/A-1"
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
_jarname=${pkgname}-app-${pkgver}.jar
noextract=($_jarname)

source=(pdfbox-preflight
        jaxb-api.jar::https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar
        activation.jar::https://repo1.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar
        pdfbox-preflight.jar::https://dlcdn.apache.org/pdfbox/${pkgver}/preflight-app-${pkgver}.jar)

sha512sums=('09661b2feca954b58677274063e71a55ee396505a8b0d392fa419e774cf47efa1ee98ffc45eeff7d3484afbc87458a22eed6c496c5a510fb54b2e73484d241f5'
            '93a47b245ab830d664a48c9d14e86198a38809ce94f72ca66b3d68746ae1d7b902f6fef2d1ac1a92c01701549ae80a07db69bd822ffd831a95d8dbffad435790'
            '49119b0cc3af02700685a55c6f15e6d40643f81640e642b9ea39a59e18d542f8837d30b43b5be006ce1a98c8ec9729bb2165c0442978168f64caa2fc6e3cb93d'
            'c1b5af7b42300f3750835d89d8808039ca303a6afabebb72a1e64dd55535eb24729141a2ba680448dc83e3870df1c4eac7701d5e735d5b0625d3019e02faaff9')

package() {
    cd "${srcdir}"

    install -D -m755 "pdfbox-preflight" "${pkgdir}/usr/bin/pdfbox-preflight"
    rm pdfbox-preflight

    rm *.jar

    zip -r "pdfbox-preflight.jar" *
    install -D -m644 "pdfbox-preflight.jar" "${pkgdir}/usr/share/pdfbox/pdfbox-preflight.jar"
}

