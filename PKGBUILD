# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Previous maintainer: Arthur Vuillard <arthur@hashbang.fr>
# Previous maintainer: Martin Imobersteg <martin.imobersteg@gmail.com>

pkgname=tidy-html5-git
pkgver=latest
pkgrel=2
pkgdesc="A tool to tidy down your HTML5 code to a clean style"
url="https://www.html-tidy.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'cmake')
provides=('tidy' 'tidyhtml')
conflicts=('tidy-html5' 'tidyhtml')
source=("$pkgname"::"git+https://github.com/htacg/tidy-html5.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$name/build/cmake"
  cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
}

package() {
  cd "$srcdir/$name/build/cmake"
  make install
  install -Dm644 $srcdir/$name/README/LICENSE.md $pkgdir/usr/share/licenses/$name/LICENSE.md
} 
