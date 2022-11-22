# Maintainer: Alexander Konarev  <avkonarev@gmail.com>
# Author: Andrey Ovsankin aka EvilBeaver

pkgname=onescript
pkgver=1.8.1
pkgrel=1
pkgdesc="This project is an alternative implementation of the virtual machine, execute scripts in the language of the 1C:Enterprise"
arch=("x86_64")
license=('GPL3' 'LGPL3')
url="http://oscript.io/"
depends=('mono')
makedepens=('tar ar xz')

source=(
        "source.deb::https://oscript.io/downloads/latest/x64/onescript-engine_${pkgver}_all.deb"
        )

md5sums=('5bcd5161c2f5e59ea4d5e4db2e53117e')


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
