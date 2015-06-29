# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=gpsprune_dev_bin
pkgver=18
pkgrel=1
pkgdesc="a java application for viewing, editing and converting coordinate data from GPS systems (dev version for testing purposes)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/prune-gps/"
license=("GPL")
depends=('java-runtime')
optdepends=('java3d' 'povray' 'exiftool' 'gpsbabel' 'gnuplot')
source=("http://activityworkshop.net/software/gpsprune/gpsprune_${pkgver}_test.jar" "http://activityworkshop.net/software/gpsprune/prunelogo.png" "gpsprune.desktop")
install='gpsprune.install'
md5sums=('b4a3f28e2404282cd073d362e29278c8'
         '0dce06ef7eec27ecff78eb0a83c0b123'
         'a5e0406c09addef4320ce0c6beff0968')
conflicts=(gpsprune_bin gpsprune)
noextract=("gpsprune_${pkgver}_test.jar")
replaces=(prune_dev_bin)

package() {
cd $srcdir
install -D -m644 ./gpsprune_${pkgver}_test.jar $pkgdir/usr/share/java/gpsprune/gpsprune_${pkgver}_test.jar
echo -e "#"'!'"/bin/bash\njava -jar /usr/share/java/gpsprune/gpsprune_${pkgver}_test.jar \"\$@\"" >./gpsprune
install -D -m755 ./gpsprune $pkgdir/usr/bin/gpsprune
install -D -m644 $srcdir/prunelogo.png $pkgdir/usr/share/pixmaps/gpsprune.png
install -D -m644 $srcdir/gpsprune.desktop $pkgdir/usr/share/applications/gpsprune.desktop
}
