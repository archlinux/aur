# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=zoem
pkgver=11.166
pkgrel=1
pkgdesc='Zoem programming language'
arch=('x86_64' 'i686')
url='http://micans.org/zoem/'
license=('GPL2')
source=("http://micans.org/zoem/src/$pkgname-${pkgver/./-}.tar.gz")
sha256sums=('1267a222ae2ee998a91dbe66df19cf998a0e7db45c7e59821049ae6b791f37fe')

build() {
  cd "$pkgname-${pkgver/./-}"
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-${pkgver/./-}" install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
