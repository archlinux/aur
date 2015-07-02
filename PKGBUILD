# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
pkgname=tidy-html5
name=tidy-html5
pkgver=5.0.0.RC1
pkgrel=2
pkgdesc="A tool to tidy down your HTML5 code to a clean style"
url="https://github.com/htacg/tidy-html5"
license=('custom')
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'cmake')
provides=('tidy')
conflicts=('tidy-html5-git' 'tidyhtml')
source=(https://github.com/htacg/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('fa1e7629daf53122c63f438cd99a9856')

build() {
  cd "$srcdir/$name-$pkgver/build/cmake"
  cmake ../.. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
}

package() {
  cd "$srcdir/$name-$pkgver/build/cmake"
  make install
  install -Dm644 $srcdir/$name-$pkgver/LICENSE.md $pkgdir/usr/share/licenses/$name/LICENSE.md
  rm -rf $pkgdir/usr/include
} 
