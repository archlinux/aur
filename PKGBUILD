# Maintainer: Swift Geek
pkgname=ich9gen-git
_pkgname="libreboot/resources/utilities/ich9deblob/"
pkgver=a
pkgrel=1
pkgdesc="ICH9 spi flash descriptor generator"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://libreboot.org"
license=('GPL')
#depends=('')
makedepends=('git')
source=("git://git.savannah.gnu.org/libreboot.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}/"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  #make DESTDIR="${pkgdir}" install
  install -d "$pkgdir/usr/bin/"
  install -m 755 "ich9gen" "${pkgdir}/usr/bin/ich9gen"
}
