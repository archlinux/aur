# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Stephen Martin <hwkiller at gmail.com>
_pkgname=nowide-master
pkgname=boost-nowide
pkgver=1.64.0
pkgrel=1
pkgdesc="Boost.Nowide is a library implemented by Artyom Beilis that make cross platform Unicode aware programming easier."
arch=("any")
url="http://cppcms.com/files/nowide/html/"
license=('custom')
depends=('boost')
makedepends=('unzip')
options=()
source=("https://github.com/artyom-beilis/nowide/archive/master.zip")
md5sums=('9df994325d42e172e110805d192a7da1')

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr"
  tar cf - include | (cd "$pkgdir/usr" && tar xf -)
  chmod 644 "$pkgdir/usr/include/boost/"*
  chmod 755 "$pkgdir/usr/include/boost"
}
