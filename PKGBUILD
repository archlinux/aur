# Contributor: XaBz <xabz.2k5@gmail.com>
# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=aladin
pkgver=12.001
pkgrel=2
pkgdesc="Interactive software sky atlas"
arch=('any')
url="http://aladin.u-strasbg.fr/aladin.gml"
depends=('java-runtime' 'sh')
license=('GPL3')
noextract=('Aladin.jar')
source=('https://aladin.u-strasbg.fr/java/Aladin.tar'
        'aladin.run' 'aladin.png' 'aladin.desktop')
md5sums=('a6aa0b930af4b28eaadd16abf27b56e0'
         '8f5c34afe96b4a3034806ea1b70c8c77'
         'c79258b73b96c53c98779ae7c2003f31'
         '870c25beb85eaf25f78530f52f0fac62')

package() {
  cd "$srcdir"
  install -D -m755 aladin.run "$pkgdir"/usr/bin/aladin
  install -D -m644 Aladin/Aladin.jar -t "$pkgdir"/usr/share/java
  install -D -m644 Aladin/COPYRIGHT -t ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 Aladin/FAQ.html -t "$pkgdir"/usr/share/aladin
  install -D -m755 aladin.desktop -t "$pkgdir"/usr/share/applications
  install -D -m755 aladin.png -t "$pkgdir"/usr/share/pixmaps
}
