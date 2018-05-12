# Maintainer: fenuks

pkgname=findbugs-contrib
pkgver=7.4.0
pkgrel=2
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
"${_spotbugs_jar}::http://search.maven.org/remotecontent?filepath=com/mebigfatguy/fb-contrib/fb-contrib/${pkgver}.sb/fb-contrib-${pkgver}.sb.jar"
)

sha256sums=('e82a9068ef5c8dd10ccf8859cf9806681d9bcd0046c8d50855b5ce787f01c18b'
            'eb694100cf30c582422f1086bef37dfbabbafa5a280474c8630bbd9284ecf0b7')

package() {
    cd "${srcdir}"
    install -Dm644 ${_findbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 ${_spotbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.sb.jar"
}
