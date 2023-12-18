# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-texturize
pkgver=2.2
pkgrel=1
pkgdesc="Generates large textures from a small sample"
arch=('i686' 'x86_64')
url="http://github.com/lmanul/gimp-texturize/"
license=('GPL')
depends=('gimp')
makedepends=('perl-xml-parser')
source=(https://github.com/lmanul/gimp-texturize/archive/master.zip)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/gimp-texturize-master"
  meson setup build
}

build() {
  cd "$srcdir"/gimp-texturize-master/build
  meson compile
}

package() {
  cd "$srcdir"/gimp-texturize-master/build
  mkdir -p "$pkgdir"/usr/lib/gimp/2.0/plug-ins/texturize
  cp texturize "$pkgdir"/usr/lib/gimp/2.0/plug-ins/texturize
}
