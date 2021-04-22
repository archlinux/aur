# Maintainer: Omar Sandoval <osandov AT osandov DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski AT archlinux.org>
# Contributor: Dan McGee <dpmcgee AT gmail.com>

pkgname=sparse
pkgver=0.6.3
pkgrel=1
pkgdesc='Semantic parser for C'
arch=('i686' 'x86_64')
url='http://sparse.wiki.kernel.org/'
license=('MIT')
depends=('perl' 'libxml2')
source=(https://www.kernel.org/pub/software/devel/sparse/dist/sparse-$pkgver.tar.xz)
sha256sums=('d4f6dbad8409e8e20a19f164b2c16f1edf76438ff77cf291935fde081b61a899')

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
