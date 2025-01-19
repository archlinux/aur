# Maintainer: fenuks

pkgname=findbugs-contrib
pkgver=7.6.9
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

sha256sums=('7163f0f271a0544445d823864a2c126ae4ce3b6a2cd20f18cdd9c242f87f0579'
            '9203f1af681600039a316f2fa6ca9d8ce52bbe3b4253aaf7321a3dfae914ab2b')

package() {
    cd "${srcdir}"
    install -Dm644 ${_findbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 ${_spotbugs_jar} "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.sb.jar"
}
