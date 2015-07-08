#
# QTCreator Homebrew Project
# 
# Game Boy Advance Development in QTCreator
#

# Maintainer: Javier J. Salmeron-Garcia <javsalgar@gmail.com>
pkgname=qtcreator-homebrew-gba
pkgver=v1.0.0.r3.g80b9b0d
pkgrel=1
pkgdesc='Allows creating homebrew Game Boy Advance (GBA) roms in QTCreator'
arch=('i686' 'x86_64')
url='https://github.com/javsalgar/qtcreator-homebrew-gba'
license=('GPL')
groups=('qtcreator-homebrew')
depends=('qtcreator' 'devkitarm' 'cmake')
source=('git+https://github.com/javsalgar/qtcreator-homebrew-gba.git')
makedepends=('git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


package() {
        echo $dstdir
        mkdir -p $pkgdir/usr/share/qtcreator/templates/wizards/homebrew/gba
	cp $srcdir/$pkgname/cmake/* $pkgdir/usr/share/qtcreator/templates/wizards/homebrew/gba
	cp $srcdir/$pkgname/qtcreator/* $pkgdir/usr/share/qtcreator/templates/wizards/homebrew/gba
}
