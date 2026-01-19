# Maintainer: fenuks

pkgname=findbugs-contrib
pkgver=7.7.4
pkgrel=1
pkgdesc="A FindBugs/SpotBugs plugin for doing static code analysis for java code bases"
arch=("any")
url="https://github.com/mebigfatguy/fb-contrib"
license=("LGPL")
depends=("java-runtime")
optdepends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
_findbugs_jar=${pkgname}-${pkgver}.jar
_spotbugs_jar=${pkgname}-${pkgver}.sb.jar
source=("${_findbugs_jar}::http://search.maven.org/remotecontent?filepath=com/mebigfatguy/fb-contrib/fb-contrib/${pkgver}/fb-contrib-${pkgver}.jar"
"${_spotbugs_jar}::http://search.maven.org/remotecontent?filepath=com/mebigfatguy/sb-contrib/sb-contrib/${pkgver}/sb-contrib-${pkgver}.jar"
)

sha256sums=('c2c147bc12e9a4c32ad3e940d8a63e7ac1c9da5bb7e800a3a8b9f118e4d67ef2'
            '78c7106ec5f7a4fda676d39a3dc1ec38c6b542addfc8f5f871bdfdf0cdad43ee')

package() {
    cd "${srcdir}"
    install -Dm644 ${_findbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 ${_spotbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.sb.jar"
}
