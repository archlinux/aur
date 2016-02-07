# Maintainer : sumt <sumt at sci dot fi>

pkgname=prpltwtr-git
pkgver=0.14.0.r7.g71c4d4f
pkgrel=1
pkgdesc="A libpurple plugin which treats microblogging (Twitter, identi.ca) as IM protocols"
arch=('i686' 'x86_64')
url="https://github.com/mikeage/prpltwtr"
license=('GPL')
depends=('libpurple' 'json-glib')
makedepends=('pidgin' 'intltool' 'libtool' 'git')
source=("prpltwtr::git+https://github.com/mikeage/prpltwtr.git")
md5sums=('SKIP')
conflicts=('prpltwtr')
provides=('prpltwtr')

pkgver() {
  cd prpltwtr
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd prpltwtr
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd prpltwtr
  make DESTDIR=$pkgdir install
}
