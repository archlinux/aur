# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
pkgname=tidy-html5
name=tidy-html5
pkgver=5.1.7
pkgrel=1
pkgdesc="A tool to tidy down your HTML5 code to a clean style"
url="https://github.com/htacg/tidy-html5"
license=('custom')
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'cmake')
provides=('tidy')
conflicts=('tidy-html5-git' 'tidyhtml')
source=(https://github.com/htacg/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('da31a2b3c48434f4592ddb6c2ab09564')

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
