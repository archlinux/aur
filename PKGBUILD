# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=jaxodraw
pkgver=2.1_0
pkgrel=3
pkgdesc="A particle physics program for drawing Feynman diagrams."
arch=(any)
url="http://jaxodraw.sourceforge.net/"
license=('GPL2')
depends=(java-runtime)
optdepends=('jaxodraw-latex: LaTeX and EPS export')
source=(http://jaxodraw.sourceforge.net/download/pkgs/jaxodraw-${pkgver/_/-}-bin.tar.gz
        jaxodraw.sh
        jaxodraw.desktop)
md5sums=('1bf230aa874cd5477be6c6f971f2ff0d'
         '78d174b502565bc224391d31936bf2bd'
         '7c8e9103245168849d67e4bfac9246be')

package() {
	cd "$srcdir"
        install -Dm755 $pkgname-${pkgver/_/-}/$pkgname-${pkgver/_/-}.jar ${pkgdir}/usr/share/java/${pkgname}/$pkgname-${pkgver}.jar

        install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
        sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}

        install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
