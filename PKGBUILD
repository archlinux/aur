# Maintainer: Omar Sandoval <osandov AT cs DOT washington DOT edu>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski AT archlinux.org>
# Contributor: Dan McGee <dpmcgee AT gmail.com>

pkgname=sparse
pkgver=0.5.1
pkgrel=1
pkgdesc='Semantic parser for C'
arch=('i686' 'x86_64')
url='http://sparse.wiki.kernel.org/'
license=('custom:OSL')
depends=('perl' 'libxml2')
source=(https://git.kernel.org/pub/scm/devel/sparse/sparse.git/snapshot/sparse-$pkgver.tar.gz)
sha256sums=('97781e5fdb95b65ab4d0e906a4cfa3f99fdb8b57c22a5c658523b69dbe95b7fb')

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
