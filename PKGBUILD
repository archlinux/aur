# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jack Random, <jack(at)random(dot)to>
# previous: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

pkgname=mu-git
pkgver=1.4.7.r248.g4dbc6ac3
pkgrel=1
epoch=1
pkgdesc="mu and mu4e from git"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
depends=('xapian-core' 'guile' 'gmime3')
makedepends=('git')
optdepends=('emacs: mu4e support')
license=('GPL')
provides=('mu')
conflicts=('mu')
source=('git+https://github.com/djcb/mu.git')
md5sums=('SKIP')

pkgver() {
  cd mu
  git describe --tags | sed 's+-+.r+' | tr - .
}

build() {
  cd mu
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd mu
  make DESTDIR="$pkgdir" install
}
