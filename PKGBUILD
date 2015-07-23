# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=vamp-onsetsds-plugin
pkgver=0.2
pkgrel=1
pkgdesc=""
arch=("i686" "x86_64")
url="http://www.vamp-plugins.org/download.html"
license=("GPL2")
depends=("vamp-plugin-sdk")
source=("http://downloads.sourceforge.net/vamp/$pkgname-$pkgver.tar.gz"
        fix_fPIC.patch)

build() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/fix_fPIC.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 vamp-onsetsds.so "$pkgdir/usr/lib/vamp/vamp-onsetsds.so"
}

# vim:set ts=2 sw=2 et:
md5sums=('b2964178130bdfacb80737f68d221139'
         'a9e380560f83ef532716a8ea782059ce')
