# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Tomas Storck <storcktomas@gmail.com
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>

pkgname=java-commons-math
_shortname=commons-math
pkgver=3.6.1
pkgrel=1
pkgdesc='Apache Commons Mathematics Library'
arch=(any)
url='http://commons.apache.org/math/'
license=('APACHE')
depends=('java-runtime')
source=("http://www-eu.apache.org/dist//commons/math/source/commons-math3-${pkgver}-src.tar.gz")
md5sums=('9698be1b485d9ff35b7b23262cb42aee')

build() {
    cd "${srcdir}/commons-math3-${pkgver}-src"

    mvn install
}

package() {
    cd "${srcdir}/${_shortname}3-${pkgver}-src/"

    install -Dm644 "target/${_shortname}3-${pkgver}.jar" "${pkgdir}/usr/share/java/${_shortname}/${_shortname}.jar"
    install -Dm644 "target/${_shortname}3-${pkgver}-tools.jar" "${pkgdir}/usr/share/java/${_shortname}/${_shortname}-tools.jar"

    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
# vim:set ts=2 sw=2 et:
