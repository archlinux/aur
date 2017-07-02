# Maintainer: Alexander Konarev  <avkonarev@gmail.com>
# Author: Andrey Ovsankin aka EvilBeaver

pkgname=onescript
pkgver=1.0.16
_pkgver=1_0_16
pkgrel=1
pkgdesc="This project is an alternative implementation of the virtual machine, execute scripts in the language of the 1C:Enterprise"
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://oscript.io/"
depends=('mono')
makedepens=('unzip')

source=(
        "source.deb::http://oscript.io/downloads/$_pkgver/deb"
        )

md5sums=('7e7d0d287c525508d5c21f7e113e4149')


prepare() {
  cd $srcdir
  for f in *.deb                 
  do
      ar p $f data.tar.xz | tar -Jx
      rm $f
  done
  rm control.tar.gz data.tar.xz deb debian-binary
}

package() {
  cd $srcdir
#  install -Dm755 oscript "$pkgdir/usr/bin/oscript"
#
#  cd $srcdir/OneScript-$pkgver/
#  mkdir -p "$pkgdir/usr/lib/oscript"


  cp -r .  $pkgdir
}
