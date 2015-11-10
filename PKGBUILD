# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=trisquel-wallpapers
pkgver=7.0_1
pkgrel=2
pkgdesc="Trisquel GNU/Linux Wallpapers, the default Wallpapers for Trisquel."
url="http://trisquel.info"
arch=('any')
license=('GPL')
depends=()
optdepends=()
makedepends=()
backup=()
install=''
source=("http://archive.trisquel.info/trisquel/pool/main/t/trisquel-wallpapers/${pkgname}_${pkgver/_/-}.tar.gz")
md5sums=('a4454ea0eb82977dd239468af80c5300')
         
package() {
   install -dm755 ${pkgdir}/usr/share/backgrounds/Trisquel
   install -dm755 ${pkgdir}/usr/share/gnome-background-properties
   install -dm755 ${pkgdir}/usr/share/mate-background-properties
   cp ${srcdir}/trisquel-wallpapers/data/usr/share/backgrounds/* ${pkgdir}/usr/share/backgrounds/Trisquel/
   sed -i 's_/usr/share/backgrounds/_/usr/share/backgrounds/Trisquel/_g' ${srcdir}/trisquel-wallpapers/data/usr/share/gnome-background-properties/trisquel-wallpapers.xml
   cp ${srcdir}/trisquel-wallpapers/data/usr/share/gnome-background-properties/trisquel-wallpapers.xml ${pkgdir}/usr/share/gnome-background-properties/
   sed -i 's/gnome-wp-list.dtd/mate-wp-list.dtd/' ${srcdir}/trisquel-wallpapers/data/usr/share/gnome-background-properties/trisquel-wallpapers.xml
   cp ${srcdir}/trisquel-wallpapers/data/usr/share/gnome-background-properties/trisquel-wallpapers.xml ${pkgdir}/usr/share/mate-background-properties/
}
