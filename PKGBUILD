# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=cd-hit
pkgver=4.6.1
pkgrel=1
pkgdesc="clustering DNA/protein sequence database at high identity with tolerance"
arch=('i686' 'x86_64')
url="https://code.google.com/p/cdhit/"
license=('GPL2')
depends=('perl')
source=(https://cdhit.googlecode.com/files/cd-hit-v$pkgver-2012-08-27.tgz)
sha1sums=('744be987a963e368ad46efa59227ea313c35ef5d')

build() {
  cd "$srcdir/cd-hit-v$pkgver-2012-08-27"

  make openmp=yes
}

package() {
  cd "$srcdir/cd-hit-v$pkgver-2012-08-27"

  for file in cd-hit cd-hit-est cd-hit-2d cd-hit-est-2d cd-hit-div cd-hit-454 *.pl ; do
    install -Dm755 "$file" "$pkgdir/usr/bin/$file"
  done
}
