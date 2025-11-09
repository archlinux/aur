# Maintainer: fenuks

pkgname=findbugs-contrib
pkgver=7.7.0
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

sha256sums=('b9f237f21607e5b6c52d4bf5031bb699d70be6ff04d1a175c864aaaf564d4c51'
            '0f98e7a9ae950629f2912595f02ecd1435fa6be9595960adef10dca36ed89f4c')

package() {
    cd "${srcdir}"
    install -Dm644 ${_findbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 ${_spotbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.sb.jar"
}
