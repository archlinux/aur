# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=sugar-artwork-git
pkgver=v0.118
pkgrel=1
pkgdesc="Sugar icons and themes"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
makedepends=('gtk2' 'gtk3' 'icon-naming-utils' 'python-empy' 'xorg-xcursorgen')
optdepends=('gtk2: GTK+ 2 theme'
            'gtk3: GTK+ 3 theme')
source=("git+https://github.com/sugarlabs/sugar-artwork.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}
