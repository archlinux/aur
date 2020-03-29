
# Maintainer: Pavel Horniak <gouster4@gmail.com>
pkgname=newflasher
pkgver=20
pkgrel=1
pkgdesc='This experimental software allows you to flash firmwares acquired through XperiFirm to Sony phones including and newer than the XZ Premium.'
arch=('x86_64')
license=('GPL')
url="https://forum.xda-developers.com/crossdevice-dev/sony/progress-newflasher-xperia-command-line-t3619426"
depends=()
makedepends=('zlib' 'expat')
source=(git://github.com/newflasher/newflasher)
provides=('newflasher')
conflicts=('newflasher')
md5sums=('SKIP')

build() {
    cd $srcdir/newflasher
    make
}

package(){

  # Removing unwanted source dir.
  rm -r $startdir/newflasher
  # Moving everything to pkg/.
  cd $srcdir/newflasher
  mkdir $pkgdir/usr $pkgdir/usr/bin
  mv newflasher $pkgdir/usr/bin/newflasher
}
