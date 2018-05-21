# Maintainer: fenuks

pkgname=findbugs-contrib
pkgver=7.4.1
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
"${_spotbugs_jar}::http://search.maven.org/remotecontent?filepath=com/mebigfatguy/fb-contrib/fb-contrib/${pkgver}.sb/fb-contrib-${pkgver}.sb.jar"
)

sha256sums=('605169ef8261a9900f1dafd2b8bfb17764fd14b3bb9b59de0669f0bef73a861d'
            '9aee8dd857bcf0436e3b196dd73d30d4e6e1e50f551d28edb7e52dfea38e9b1a')

package() {
    cd "${srcdir}"
    install -Dm644 ${_findbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 ${_spotbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.sb.jar"
}
