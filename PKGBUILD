# Maintainer: fenuks

pkgname=findbugs-contrib
pkgver=7.2.1
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

sha256sums=('58e705232f10b06cf66d71c70ad6b76cc547c4d77eda3c2bf0dfd2e53dfe63d2'
            '705e70a2a0c85ad89d0f18916df093ac6381405d1037cd0e41bc9d6ebf2cb2d7')

package() {
    cd "${srcdir}"
    install -Dm644 ${_findbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${_findbugs_jar}"
    install -Dm644 ${_spotbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/"
}
