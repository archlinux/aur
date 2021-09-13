# Maintainer: Alexander Konarev  <avkonarev@gmail.com>
# Author: Andrey Ovsankin aka EvilBeaver

pkgname=onescript
pkgver=1.7.0
pkgrel=1
pkgdesc="This project is an alternative implementation of the virtual machine, execute scripts in the language of the 1C:Enterprise"
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://oscript.io/"
depends=('mono')
makedepens=('tar ar xz')

source=(
        "source.deb::https://oscript.io/downloads/latest/x64/onescript-engine_1.7.0_all.deb"
        )

md5sums=('1c9a6bf40455fae9b7d57def19e65119')


prepare() {
  cd $srcdir
  for f in *.deb                 
  do
      ar p $f data.tar.xz | tar -Jx
      rm $f
  done
  rm control.tar.gz data.tar.xz debian-binary
}

package() {
  cd $srcdir
  cp -r .  $pkgdir
}
