# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar-artwork-git
pkgver=0.116.g
pkgrel=5
pkgdesc="Sugar icons and themes"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
makedepends=('gtk2' 'gtk3' 'icon-naming-utils' 'python' 'xorg-xcursorgen')
optdepends=('gtk2: GTK+ 2 theme'
            'gtk3: GTK+ 3 theme')
source=("git+https://github.com/sugarlabs/sugar-artwork.git")
sha256sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
