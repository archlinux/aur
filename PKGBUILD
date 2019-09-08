# Maintainer: Michal Lisowski <lisu at riseup dot net>

pkgname=lilyterm-git
pkgver=0.9.9.4.147.gfaf1254
pkgrel=1
pkgdesc="A light and easy to use libvte based X terminal emulator"
arch=('i686' 'x86_64')
url="http://lilyterm.luna.com.tw/index_en.html"
license=('GPL3')
depends=('vte-legacy' 'gtk2')
makedepends=('gettext' 'intltool' 'git')
provides=('lilyterm')
conflicts=('lilyterm')
source=('lilyterm::git+https://github.com/Tetralet/LilyTerm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/lilyterm
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir"/lilyterm
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/lilyterm
  make DESTDIR="$pkgdir" install
}

