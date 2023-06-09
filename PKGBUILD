# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.32
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc')
depends=('python' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import'
            'sccs: alternative backend')
source=("https://gitlab.com/esr/src/-/archive/$pkgver/src-$pkgver.tar.gz")
b2sums=('b83ff8e2f48db6b53eb62b3f7aa21bb18cf1101eb55230f111b720837fbf79cdfbe2224d12e1d08e6648f18de73fa8fc0997ed873ae6f1dcf908144d4eb891aa')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
