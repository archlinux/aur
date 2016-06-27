#Contributor: Frederic Bezies <fredbezies at gmail dot com> 
#Maintainer: Rémy EVEN <evenremy@gmail.com>, snoopy33
pkgname=littre2
pkgver=2.0
pkgrel=2
pkgdesc="The great french dictionary of Émile Littré (Qt)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dictionnaire-le-littre/"
license=('GPL3')
depends=('qt4')
source=(http://dictionnaire-le-littre.googlecode.com/files/Littre-source-${pkgver}.tar.bz2 \
 	$pkgname.desktop)
	
md5sums=('c71666ae4cf6353d2bbb7e98dcca9159'
         'a778f94a30ee78b153099acd4050af91')

build() {
  cd "$srcdir/Littre-source-$pkgver"
  qmake-qt4
  make
}

package() {
  install -D ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -d "$srcdir/Littre-source-$pkgver"/bin/ ${pkgdir}/opt/${pkgname}/
  install -D "$srcdir/Littre-source-$pkgver"/"ui/Girls I do adore....png" ${pkgdir}/usr/share/pixmaps/littre.png
  install -D "$srcdir/Littre-source-$pkgver"/bin/* ${pkgdir}/opt/${pkgname}/
  install -D "$srcdir/Littre-source-$pkgver"/Licence-CeCILL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}



