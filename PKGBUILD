# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=4.1.4
pkgrel=1
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
optdepends=('alsa-utils: sound notification support'
            'libnotify: notify support')
options=(!strip)
appimage=$pkgname-$pkgver-x86_64.AppImage
source=(
https://mikutter.hachune.net/bin/$appimage
mikutter.desktop
)

package() {
  chmod a+x $appimage
  ./$appimage --appimage-extract

  mkdir -p $pkgdir/usr/share/icons
  cp squashfs-root/mikutter.png $pkgdir/usr/share/icons

  mkdir -p $pkgdir/usr/bin
  cp $appimage $pkgdir/usr/bin/mikutter

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/mikutter.desktop $pkgdir/usr/share/applications
  chmod a+x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('19cb903db5f54536884cb69fba673581'
         'be88935513f84d6287cc084e1c50cd88' )
