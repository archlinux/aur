# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=0.10.0rc2
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('libgphoto2' 'lcms' 'kdegraphics' 'kdepimlibs' 'jasper>=1.900.1' 'lensfun')
makedepends=('pkgconfig' 'cmake')
source=(http://downloads.sourceforge.net/digikam/${pkgname}-0.10.0-rc2.tar.bz2)
replaces=('digikamimageplugins')
optdepends=('kipi-plugins: for more extras and plugins')

build() {
  cd ${srcdir}/${pkgname}-0.10.0-rc2
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=no -DWITH_MarbleWidget=no
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
   # remove conflicting files
   rm ${pkgdir}/usr/share/icons/oxygen/128x128/apps/digikam.png
   rm ${pkgdir}/usr/share/icons/oxygen/128x128/apps/showfoto.png
   rm ${pkgdir}/usr/share/icons/oxygen/16x16/actions/transform-crop-and-resize.png
   rm ${pkgdir}/usr/share/icons/oxygen/16x16/actions/view-object-histogram-linear.png
   rm ${pkgdir}/usr/share/icons/oxygen/16x16/actions/view-object-histogram-logarithmic.png
   rm ${pkgdir}/usr/share/icons/oxygen/16x16/apps/digikam.png
   rm ${pkgdir}/usr/share/icons/oxygen/16x16/apps/showfoto.png
   rm ${pkgdir}/usr/share/icons/oxygen/22x22/actions/transform-crop-and-resize.png
   rm ${pkgdir}/usr/share/icons/oxygen/22x22/actions/view-object-histogram-linear.png
   rm ${pkgdir}/usr/share/icons/oxygen/22x22/actions/view-object-histogram-logarithmic.png
   rm ${pkgdir}/usr/share/icons/oxygen/22x22/apps/digikam.png
   rm ${pkgdir}/usr/share/icons/oxygen/22x22/apps/showfoto.png
   rm ${pkgdir}/usr/share/icons/oxygen/32x32/actions/transform-crop-and-resize.png
   rm ${pkgdir}/usr/share/icons/oxygen/32x32/actions/view-object-histogram-linear.png
   rm ${pkgdir}/usr/share/icons/oxygen/32x32/actions/view-object-histogram-logarithmic.png
   rm ${pkgdir}/usr/share/icons/oxygen/32x32/apps/digikam.png
   rm ${pkgdir}/usr/share/icons/oxygen/32x32/apps/showfoto.png
   rm ${pkgdir}/usr/share/icons/oxygen/48x48/actions/transform-crop-and-resize.png
   rm ${pkgdir}/usr/share/icons/oxygen/48x48/apps/digikam.png
   rm ${pkgdir}/usr/share/icons/oxygen/48x48/apps/showfoto.png
   rm ${pkgdir}/usr/share/icons/oxygen/64x64/apps/digikam.png
   rm ${pkgdir}/usr/share/icons/oxygen/64x64/apps/showfoto.png
   rm ${pkgdir}/usr/share/icons/oxygen/scalable/actions/transform-crop-and-resize.svgz
   rm ${pkgdir}/usr/share/icons/oxygen/scalable/actions/view-object-histogram-linear.svgz
   rm ${pkgdir}/usr/share/icons/oxygen/scalable/actions/view-object-histogram-logarithmic.svgz
   rm ${pkgdir}/usr/share/icons/oxygen/scalable/apps/digikam.svgz
   rm ${pkgdir}/usr/share/icons/oxygen/scalable/apps/showfoto.svgz
 }
md5sums=('7e149f44b3ba743ee6f8880ba748c282')
