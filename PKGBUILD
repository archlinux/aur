# Maintainer: carlos_manuel_83@hotmail.com  
# Contributer: giacomogiorgianni@gmail.com 

pkgname=kde-services
pkgver=2.0
pkgrel=8
pkgdesc="kde-service multifunction"
arch=('any')
url="https://opendesktop.org/content/show.php/kde-services?content=147065"
license=('GPL')
depends=('kdebase-runtime' 'dmidecode' 'festival' 'poppler' 'ffmpeg' 'transcode' 'ghostscript' 'fuse' 'cdrkit' 'diffutils' 'fuseiso')
source=("http://downloads.sourceforge.net/project/kde-services/Source-Code/$pkgname-$pkgver.tar.bz2" System-Tools_addtoservicemenu.desktop)
md5sums=('903f63348e5c04e5aaeb5d23f4c3b4e3'
         '2a096a1c7f0b579c37fa0046b46e6770')
install=${pkgname}.install

package() {
  cd $srcdir/$pkgname-$pkgver
  #sed "255s|xdg-mime|##|" -i Makefile
  sed "260s|update|##|" -i Makefile
  sed "261s|xdg|##|" -i Makefile
  sed "262s|xdg|##|" -i Makefile
  sed "32s|xdg|##|" -i Makefile
  sed "33s|update|##|" -i Makefile
  sed "34s|xdg|##|" -i Makefile
  sed "35s|xdg|##|" -i Makefile
  #sed "264s|update|##|" -i Makefile
  #sed "265s|xdg|##|" -i Makefile
  #sed "266s|xdg|##|" -i Makefile
 
  #sed "27s|/usr|${pkgdir}/usr|" -i Makefile
  make "RPM_BUILD_ROOT=${pkgdir}" install
  # remove kernel rebuild entry is for fedora linux
  rm $pkgdir/usr/share/applications/System_Tools*kernel*
  rm $pkgdir/usr/share/applications/*package*
  #sed '13,36d' <$pkgdir/usr/share/kde4/services/ServiceMenus/System-Tools_addtoservicemenu.desktop
  cp $srcdir/System-Tools_addtoservicemenu.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/System-Tools_addtoservicemenu.desktop
}
