# Maintainer: Eduardo Rocha <edarocha1324@gmail.com>

pkgname=boolr
_pkgname=BOOLR
pkgver=v1.0.3
pkgrel=1
pkgdesc="A digital logic simulator"
arch=('x86_64')
url="https://github.com/GGBRW/BOOLR"
license=('MIT')
source=("$url/releases/download/$pkgver/BOOLR-$pkgver-linux-x86_64.zip"
        boolr.desktop)
sha256sums=('94fa88d65442687aa6aa4ac2d3f5a0c76ed13d45adf98bcc6609f3118c90bb29'
            '0a0d5da05c8e3c5f1c8f72a383503fffc9933972a6dc780d817027180c782e90')

package() {
  mkdir -p $pkgdir/opt/
  mkdir -p $pkgdir/usr/bin/

  cp -r $srcdir/BOOLR-linux-x64/ $pkgdir/opt/boolr
  chmod -R a+rw $pkgdir/opt/boolr/resources/app/saves
  chmod -R a+rw $pkgdir/opt/boolr/resources/app/data

  local _icon_dir="usr/share/icons/hicolor"
  install -D $srcdir/BOOLR-linux-x64/resources/app/build/icon.png $pkgdir/$_icon_dir/128x128/apps/boolr.png

  install -D $srcdir/boolr.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

  ln -s /opt/boolr/BOOLR $pkgdir/usr/bin/$pkgname
}
