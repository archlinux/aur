# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>
# Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
# Contributor: mickele
# Contributor: Dan Serban
# Contributor: Loui Chang <louipc dot ist at gmail company> (SPAMMERS!)

pkgname=draftsight
pkgver=2016SP1
pkgrel=2
pkgdesc="Freeware CAD software for your DWG/DXF files."
arch=('x86_64')
url="http://www.3ds.com/products/draftsight/"
license=('custom')
depends=('desktop-file-utils'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'gstreamer0.10-base'
         'gtk2'
         'libcups'
         'libgl'
         'libice'
         'libmariadbclient'
         'libpng12'
         'libsm'
         'libx11'
         'libxext'
         'libxrender'
         'postgresql-libs'
         'mesa'
         'zlib')
install='draftsight.install'
source=("http://www.draftsight.com/download-linux-fedora"
        "draftsight.desktop")
md5sums=('1bc8b2d4c69314f0d612a6c8e09d5acb'
         'cfda3b8675a93ccfb768873c1a873199')

_pkgprefix='opt/dassault-systemes/DraftSight'

package()
{
  mkdir -p $pkgdir/usr/bin
  echo "env vblank_mode=0 /${_pkgprefix}/Linux/DraftSight" > \
       $pkgdir/usr/bin/draftsight
  chmod 755 $pkgdir/usr/bin/draftsight

  mkdir -p $pkgdir/$_pkgprefix
  cd $srcdir/$_pkgprefix
  install -Dm644 Eula/english/eula.htm $pkgdir/usr/share/licenses/draftsight/LICENSE
  install -Dm644 Resources/pixmaps/128x128/program.png $pkgdir/usr/share/icons/hicolor/128x128/apps/draftsight.png
  install -Dm644 Resources/pixmaps/64x64/program.png $pkgdir/usr/share/icons/hicolor/64x64/apps/draftsight.png
  install -Dm644 Resources/pixmaps/48x48/program.png $pkgdir/usr/share/icons/hicolor/48x48/apps/draftsight.png
  install -Dm644 Resources/pixmaps/32x32/program.png $pkgdir/usr/share/icons/hicolor/32x32/apps/draftsight.png
  install -Dm644 Resources/pixmaps/16x16/program.png $pkgdir/usr/share/icons/hicolor/16x16/apps/draftsight.png
  install -Dm644 Resources/pixmaps/128x128/file-dwg.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/file-dwg.png
  install -Dm644 Resources/pixmaps/64x64/file-dwg.png $pkgdir/usr/share/icons/hicolor/64x64/mimetypes/file-dwg.png
  install -Dm644 Resources/pixmaps/48x48/file-dwg.png $pkgdir/usr/share/icons/hicolor/48x48/mimetypes/file-dwg.png
  install -Dm644 Resources/pixmaps/32x32/file-dwg.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/file-dwg.png
  install -Dm644 Resources/pixmaps/16x16/file-dwg.png $pkgdir/usr/share/icons/hicolor/16x16/mimetypes/file-dwg.png
  install -Dm644 Resources/pixmaps/128x128/file-dxf.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/file-dxf.png
  install -Dm644 Resources/pixmaps/64x64/file-dxf.png $pkgdir/usr/share/icons/hicolor/64x64/mimetypes/file-dxf.png
  install -Dm644 Resources/pixmaps/48x48/file-dxf.png $pkgdir/usr/share/icons/hicolor/48x48/mimetypes/file-dxf.png
  install -Dm644 Resources/pixmaps/32x32/file-dxf.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/file-dxf.png
  install -Dm644 Resources/pixmaps/16x16/file-dxf.png $pkgdir/usr/share/icons/hicolor/16x16/mimetypes/file-dxf.png
  install -Dm644 Resources/pixmaps/128x128/file-dwt.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/file-dwt.png
  install -Dm644 Resources/pixmaps/64x64/file-dwt.png $pkgdir/usr/share/icons/hicolor/64x64/mimetypes/file-dwt.png
  install -Dm644 Resources/pixmaps/48x48/file-dwt.png $pkgdir/usr/share/icons/hicolor/48x48/mimetypes/file-dwt.png
  install -Dm644 Resources/pixmaps/32x32/file-dwt.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/file-dwt.png
  install -Dm644 Resources/pixmaps/16x16/file-dwt.png $pkgdir/usr/share/icons/hicolor/16x16/mimetypes/file-dwt.png
  install -Dm644 Resources/dassault-systemes_draftsight-dwg.xml $pkgdir/usr/share/mime/application/dassault-systemes_draftsight-dwg.xml
  install -Dm644 Resources/dassault-systemes_draftsight-dxf.xml $pkgdir/usr/share/mime/application/dassault-systemes_draftsight-dxf.xml
  install -Dm644 Resources/dassault-systemes_draftsight-dwt.xml $pkgdir/usr/share/mime/application/dassault-systemes_draftsight-dwt.xml

  install -Dm644 $srcdir/draftsight.desktop $pkgdir/usr/share/applications/draftsight.desktop
  # The provided .desktop entry is poorly written and does not disable vblank
  # when called.
  #install -Dm644 $srcdir/$_pkgprefix/Resources/dassault-systemes_draftsight.desktop $pkgdir/usr/share/applications/dassault-systemes_draftsight.desktop

  cp -pr $srcdir/$_pkgprefix/* $pkgdir/$_pkgprefix/
}
