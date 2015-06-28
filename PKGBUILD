# Maintainer: Petteri Tolonen <petteri[dot]tolonen[at]gmail[dot]com>

pkgname=jugglinglab
pkgver=0.6.2
pkgrel=2
pkgdesc="An application for creating and animating juggling patterns."
arch=('any')
url="http://jugglinglab.sourceforge.net/"
license=('GPL')
depends=('bash' 'java-runtime')
makedepends=('gzip' 'sed')
source=(http://downloads.sourceforge.net/project/jugglinglab/Juggling%20Lab/JugglingLab-${pkgver}_other.tar.gz)
md5sums=('752a399833f0c78c2a2517ef6fffc46b')

package() {

   cd $startdir/src/JugglingLab
   mkdir -p -m755 $pkgdir/usr/share/jugglinglab/patterns
   mkdir -p $pkgdir/usr/bin
   cd $srcdir/JugglingLab/
   install -m644 bin/JugglingLab.jar $pkgdir/usr/share/jugglinglab/
   sed -i 's|bin/JugglingLab.jar|/usr/share/jugglinglab/JugglingLab.jar|g' ./JugglingLab
   install -m755 JugglingLab $pkgdir/usr/bin/jugglinglab
   install -m644 COPYING.txt $pkgdir/usr/share/jugglinglab/
   install -m644 README.html $pkgdir/usr/share/jugglinglab/
   install -m644 patterns/* $pkgdir/usr/share/jugglinglab/patterns/

}
