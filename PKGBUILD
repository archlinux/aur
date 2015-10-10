# Maintainer: Nicola Bignami <nicola@kernel-panic.no-ip.net>
 
pkgname=foomatic-db-foo2zjs
arch=('i686' 'x86_64')
_snapdate=20141011
pkgver=${_snapdate}
pkgrel=1
epoch=3
license=('GPL' 'custom')
pkgdesc="Foomatic - The collected knowledge about printers, drivers, and driver options in XML files, used by foomatic-db-engine to generate PPD files. Rebuilt for use with foo2zjs."
depends=('perl' 'libxml2')
conflicts=('foomatic-db-ppd' 'foomatic-db-hpijs' 'foomatic-db' 'foo2zjs-testing')
provides=('foomatic-db-hpijs' 'foomatic-db')
makedepends=('cups' 'perl' 'libxml2' 'enscript' 'perl' 'net-snmp' 'bash' 'bzr')
source=(foomatic-db-foo2zjs::bzr+http://bzr.linuxfoundation.org/openprinting/foomatic/foomatic-db/)
url="http://www.linuxprinting.org/foomatic.html"
md5sums=('SKIP')

package() {
   cd ${srcdir}/${pkgname}
   bzr revno
   echo $pkgver
   ./make_configure
   ./configure --prefix=/usr
   make DESTDIR=${pkgdir} install
   install -v -Dm644 ${srcdir}/${pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING

   # foo2zjs provides different versions of the following files

   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2hiperc.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2hp.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2lava.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2oak-z1.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2oak.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2qpdl.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2slx.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2xqx.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2zjs.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2hbpl2.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2zjs-z1.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2zjs-z2.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/driver/foo2zjs-z3.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1000.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1005.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1018.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1020.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1022.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_M1005_MFP.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1022n.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_1022nw.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P1005.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P1006.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P1007.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P1008.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-Color_LaserJet_1500.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-Color_LaserJet_1600.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-Color_LaserJet_2600n.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-Color_LaserJet_CP1215.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_M1120_MFP.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_M1319_MFP.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P1505.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P1505n.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P2014.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P2014n.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P2035.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_P2035n.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_Pro_CP1025nw.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_Pro_P1102.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_Pro_P1102w.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_Pro_P1566.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/HP-LaserJet_Pro_P1606dn.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Minolta-magicolor_2200_DL.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Minolta-magicolor_2300_DL.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Minolta-magicolor_2430_DL.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_2430_DL.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_2480_MF.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_2490_MF.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_2530_DL.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_1680MF.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_1690MF.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_4690MF.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/KONICA_MINOLTA-magicolor_1600W.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Kyocera-KM-1635.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Kyocera-KM-2035.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Xerox-Phaser_6110.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Xerox-Phaser_6115MFP.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Xerox-Phaser_6121MFP.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Xerox-WorkCentre_6015.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Fuji_Xerox-DocuPrint_CM205.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-300.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-310.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-315.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-325.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-365.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-600.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-610.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLP-620.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLX-2160.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLX-3160.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLX-3175.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Samsung-CLX-3185.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Generic-OAKT_Printer.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Generic-ZjStream_Printer.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Lexmark-C500.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Minolta-Color_PageWorks_Pro_L.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C110.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C301dn.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C310dn.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C3100.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C3200.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C3300.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C3400.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C3530_MFP.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C5100.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C5200.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C5500.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C5600.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C5650.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Oki-C5800.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Dell-1355.xml
   rm ${pkgdir}/usr/share/foomatic/db/source/printer/Olivetti-d-Color_P160W.xml
}
 
