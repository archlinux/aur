# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=trisquel-wallpapers
pkgver=8.0_1
pkgrel=1
pkgdesc="The default Wallpapers for Trisquel."
url="http://trisquel.info"
arch=('any')
license=('GPL')
source=("http://archive.trisquel.info/trisquel/pool/main/t/trisquel-wallpapers/${pkgname}_${pkgver/_/-}.tar.gz")
sha256sums=('c130095a3609e726d72770e96e9b823d2369d5c1634ec2ebd9291896478c5ea8')

prepare() {
  cd ${pkgname}
  sed -i 's_/usr/share/backgrounds/_/usr/share/backgrounds/trisquel/_g' ./data/usr/share/gnome-background-properties/trisquel-wallpapers.xml
  sed -i 's/gnome-wp-list.dtd/mate-wp-list.dtd/' ./data/usr/share/gnome-background-properties/trisquel-wallpapers.xml
}         
package() {
  cd ${pkgname}
  install -d ${pkgdir}/usr/share/{backgrounds/trisquel,gnome-background-properties,mate-background-properties}
  cp ./data/usr/share/backgrounds/* ${pkgdir}/usr/share/backgrounds/trisquel/  
  cp ./data/usr/share/gnome-background-properties/trisquel-wallpapers.xml ${pkgdir}/usr/share/gnome-background-properties/  
  cp ./data/usr/share/gnome-background-properties/trisquel-wallpapers.xml ${pkgdir}/usr/share/mate-background-properties/
}
# vim:set ts=2 sw=2 et:
