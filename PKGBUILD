# Maintainer: Jack Random, <jack(at)random(dot)to>
# previous: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

pkgname=mu-git
pkgver=1.3.6.11.gf4874cd7
pkgrel=1
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
  printf "%s" "$(git describe --tags | tr - .)"
}

prepare() {
  cd mu
  ./autogen.sh
}

build() {
  cd mu
  ./configure --prefix=/usr
}

package() {
  cd mu
  make DESTDIR="$pkgdir" install
}
