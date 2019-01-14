# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=jqassistant
pkgver=1.6.0
pkgrel=2
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
source=('https://jqassistant.org/wp-content/uploads/2018/12/jqassistant-commandline-neo4jv3-1.6.0-distribution.zip' 'launcher.sh')
noextract=()
md5sums=('64f14337fb7a0c06ae2f05e73295abd8' 'fa9d3e0628cda8818ddf572a6bc394b5')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    rm ${pkgname}-commandline-neo4jv3-${pkgver}-distribution.zip
    mv ${pkgname}-commandline-neo4jv3-${pkgver} ${pkgname}
    cd ${pkgname}
    cp -a ./* ${pkgdir}/opt/${pkgname}
    install -d ${pkgdir}/usr/bin/
    cp ../launcher.sh ${pkgdir}/usr/bin/jqassistant
    
    install -d -Dm775 ${pkgdir}/opt/${pkgname}/${pkgname}
}
