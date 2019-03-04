# Maintainer: Omar Sandoval <osandov AT osandov DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski AT archlinux.org>
# Contributor: Dan McGee <dpmcgee AT gmail.com>

pkgname=sparse
pkgver=0.5.2
pkgrel=2
pkgdesc='Semantic parser for C'
arch=('i686' 'x86_64')
url='http://sparse.wiki.kernel.org/'
license=('MIT')
depends=('perl' 'libxml2')
source=(https://www.kernel.org/pub/software/devel/sparse/dist/sparse-$pkgver.tar.xz)
sha256sums=('4632b7b74af72214247f982f976ba44206933bab3a2717e09df166fb5b8abe7a')

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
