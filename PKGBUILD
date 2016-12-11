# Contributor: Rasi <rasi13@gmx.de>
# Contributor: archistic <archistic AT archlinux.org>
# Maintainer: archistic <archistic AT archlinux.org>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=scrobby-git
_pkgname=scrobby
pkgver=20130328
pkgrel=2
pkgdesc="C++ last.fm Client for MPD"
arch=('i686' 'x86_64')
url="http://unkart.ovh.org/scrobby/"
license=('GPL2')
depends=('curl' 'openssl')
install=scrobby.install
makedepends=('git')
options=(!strip)
# Using a fork for the source, since the original does not compile
source=("$_pkgname::git+https://github.com/wor/scrobby.git")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
