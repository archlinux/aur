# Contributor: orumin <dev@orum.in>

pkgname=myfleetgirls
pkgver=1
pkgrel=3
pkgdesc="Game client for 'KanColle'"
arch=('any')
url="http://myfleet.moe"
license=('CUSTOM')
depends=('java-environment')
makedepends=('unzip')
source=('https://myfleetweb.herokuapp.com/redirect/assets/zip/MyFleetGirls.zip'
        'MyFleetGirls.desktop')
md5sums=('SKIP'
         '7e4078c6e62a27603f011abf1a99c37a')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/licenses/MyFleetGirls"
    install -d "${pkgdir}/usr/share/applications/"
    install -d -m777 "${pkgdir}/opt/MyFleetGirls"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/MyFleetGirls/LICENSE"
    install -m644 application.conf.sample "${pkgdir}/opt/MyFleetGirls/application.conf"
    install -m644 LICENSE "${pkgdir}/opt/MyFleetGirls"
    install -m644 myfleetgirls.keystore "${pkgdir}/opt/MyFleetGirls"
    install -m644 update.properties "${pkgdir}/opt/MyFleetGirls"
    install -m644 update.jar "${pkgdir}/opt/MyFleetGirls"
    install -m755 MyFleetGirls.sh "${pkgdir}/opt/MyFleetGirls"
    install -m644 MyFleetGirls.desktop "${pkgdir}/usr/share/applications/MyFleetGirls.desktop"
}
