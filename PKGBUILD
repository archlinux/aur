# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>

pkgname=restclient
pkgver=3.7.1
pkgrel=1
pkgdesc="RESTClient is a Java application to test RESTful webservices. It can be used to test variety of HTTP communications."
arch=("any")
url="https://github.com/wiztools/rest-client"
license=('BSD')
depends=('java-runtime')
install=${pkgname}.install
source=("https://github.com/wiztools/rest-client/releases/download/${pkgver}/${pkgname}-ui-fat-${pkgver}.jar"
        "https://github.com/wiztools/rest-client/releases/download/${pkgver}/${pkgname}-cli-fat-${pkgver}.jar"
        restclient restclient-cli restclient.desktop restclient.png)
noextract=("${pkgname}-ui-fat-${pkgver}.jar"
           "${pkgname}-cli-fat-${pkgver}.jar")
package() {
    jar -xf ${srcdir}/${pkgname}-ui-fat-${pkgver}.jar LICENSE.txt

    install -Dm644 "${pkgname}-ui-fat-${pkgver}.jar" \
                  "${pkgdir}/usr/share/java/${pkgname}/restclient-ui.jar"
    install -Dm644 "${pkgname}-cli-fat-${pkgver}.jar" \
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
sha256sums=('ea575df3f96841fbe6a294c04e0357a75f3541dab8d418e0f49e43a393a3daee'
            'f85f2c0d516f1834745e50567f6f347b30de0531a2aca8f5476f0f973f9fe819'
            'fba871a8b79a220218d01934b8782485c2198509d9a142f635374a46704ef09e'
            'ca367cd056d56ad7a370fca15233fb619b82c146d3c10ac2ea7bbe3e51953099'
            'bba0973de659d2da536e7700e7817f8cdd9607016896e962709379f98664dd69'
            '2f7f1238e18969533538a88a3d1d7131f6c28e549347bd58d95e382173d08b1f')
