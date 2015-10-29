# Maintainer: Eduardo Leggiero <https://www.leggiero.uk/>

pkgname=restclient
pkgver=3.5
pkgrel=2
pkgdesc="RESTClient is a Java application to test RESTful webservices. It can be used to test variety of HTTP communications."
arch=("any")
url="https://github.com/wiztools/rest-client"
license=('BSD')
depends=('java-runtime')
install=${pkgname}.install
source=("https://github.com/wiztools/rest-client/releases/download/${pkgname}-${pkgver}/${pkgname}-ui-${pkgver}-jar-with-dependencies.jar"
        "https://github.com/wiztools/rest-client/releases/download/${pkgname}-${pkgver}/${pkgname}-cli-${pkgver}-jar-with-dependencies.jar"
        restclient restclient-cli restclient.desktop restclient.png)
noextract=("${pkgname}-ui-${pkgver}-jar-with-dependencies.jar"
           "${pkgname}-cli-${pkgver}-jar-with-dependencies.jar")
md5sums=('5f87136aac60ce97f063d8c3f1a3449e'
         '9ae25f4050538277abbfa0314674891f'
         'e52d2f6bd21a9c15a52cc28c2d580446'
         '3a1bb520959a5e2d4502a85d79e20f11'
         '5f1dd027fa05034d996cc710c9ad0d15'
         '143f4391e8bc98210a6baf5d4e01108b')

package() {
    jar -xf ${srcdir}/${pkgname}-ui-${pkgver}-jar-with-dependencies.jar LICENSE.txt

    install -Dm644 "${pkgname}-ui-${pkgver}-jar-with-dependencies.jar" \
                  "${pkgdir}/usr/share/java/${pkgname}/restclient-ui.jar"
    install -Dm644 "${pkgname}-cli-${pkgver}-jar-with-dependencies.jar" \
                  "${pkgdir}/usr/share/java/${pkgname}/restclient-cli.jar"
    install -Dm755 restclient \
                  "${pkgdir}/usr/bin/restclient"
    install -Dm755 restclient-cli \
                  "${pkgdir}/usr/bin/restclient-cli"
    install -Dm644 ${pkgname}.desktop \
                  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 restclient.png \
                  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/restclient.png"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
