# Maintainer: Omar Sandoval <osandov AT osandov DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski AT archlinux.org>
# Contributor: Dan McGee <dpmcgee AT gmail.com>

pkgname=sparse
pkgver=0.6.4
pkgrel=1
pkgdesc='Semantic parser for C'
arch=('i686' 'x86_64')
url='http://sparse.wiki.kernel.org/'
license=('MIT')
depends=('perl' 'libxml2')
source=(https://www.kernel.org/pub/software/devel/sparse/dist/sparse-$pkgver.tar.xz)
sha256sums=('6ab28b4991bc6aedbd73550291360aa6ab3df41f59206a9bde9690208a6e387c')

prepare() {
  cd $pkgbase-$pkgver
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/sparse/LICENSE
}
