# Maintainer: Zoltán Guba <zoltan.guba@gubamm.hu>
# Contributor: Gregory25 <hegedusgergomka@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>

pkgname=hdsentinel_gui
pkgver=2.0.0
pkgrel=3
pkgdesc="A freeware, closed source, SMART analysis tool with GUI"
arch=('i686' 'x86_64')
url="http://www.hdsentinel.com/hard_disk_sentinel_linux_gui.php"
license=('unknown')
depends=(gtk2)
source_i686=(hdsentinel_gui32bit.tar.gz::https://www.hdsentinel.com/hdslin/hdsentinel_gui32bit.tar.gz)
md5sums_i686=('9be70938647a465296be0b8b9c2d2349')
source_x86_64=(hdsentinel_gui64bit.tar.gz::https://www.hdsentinel.com/hdslin/hdsentinel_gui64bit.tar.gz)
md5sums_x86_64=('898d05f8bb9a010d64dcb5b1f907b7ff')

package() {
  cd $srcdir/HDSentinel_GUI
  bsdtar -xf "HDSentinel_GUI.zip"
  sed -i 's/\/usr\/share\/bin/\/usr\/bin/' HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
  install -m755 -D "HDSentinel_GUI/HDSentinel_GUI" $pkgdir/usr/bin/HDSentinel_GUI || return 1
  install -m755 -D "HDSentinel_GUI/HDSentinel" $pkgdir/usr/bin/HDSentinel || return 1
  install -m644 -D "HDSentinel_GUI/HDSentinel_GUI.ico" $pkgdir/usr/share/icons/HDSentinel_GUI.ico || return 1
  install -m644 -D "HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop" $pkgdir/usr/share/applications/Hard_Disk_Sentinel_GUI.desktop || return 1
  install -m644 -D "readme" $pkgdir/usr/share/doc/$pkgname/readme || return 1
  install -m644 -D "version" $pkgdir/usr/share/doc/$pkgname/version || return 1
}

