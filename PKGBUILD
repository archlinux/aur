# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=jqassistant
pkgver=1.4.0
pkgrel=1
pkgdesc="Scan, explore and validate your Java application in a few minutes"
arch=('any')
url="https://jqassistant.org/"
license=('GPL3')
groups=()
depends=('bash' 'java-environment')
makedepends=()
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=()
source=('https://jqassistant.org/wp-content/uploads/2018/06/jqassistant-commandline-neo4jv3-1.4.0-distribution.zip' 'launcher.sh')
noextract=()
md5sums=('a52116f3139619aa995c710f07e84e5f' 'fa9d3e0628cda8818ddf572a6bc394b5')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    rm ${pkgname}-commandline-neo4jv3-${pkgver}-distribution.zip
    mv ${pkgname}-commandline-neo4jv3-1.4.0 ${pkgname}
    cd ${pkgname}
    cp -a ./* ${pkgdir}/opt/${pkgname}
    install -d ${pkgdir}/usr/bin/
    cp ../launcher.sh ${pkgdir}/usr/bin/jqassistant
    
    install -d -Dm775 ${pkgdir}/opt/${pkgname}/${pkgname}
}
