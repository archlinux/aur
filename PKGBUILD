# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=4.0.5
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
  mkdir -p $pkgdir/usr/bin
  cp $appimage $pkgdir/usr/bin/mikutter
  chmod a+x $pkgdir/usr/bin/mikutter

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/mikutter.desktop $pkgdir/usr/share/applications
  chmod a+x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('6f6ea290ed6c3b376d0295f619f9ca30'
         '82f7f4d37380871d3fde314fe51cf406' )
