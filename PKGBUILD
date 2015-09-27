#  Maintainer: Matthew Hague <matthewhague a zoho com>
# Contributor: Matthew Hague <matthewhague a zoho com>
# Contributor: Matthew Hague <matthewhague a zoho com>

pkgname=mutt_vc_query-git
pkgver=001
pkgrel=1
pkgdesc="Query vCard database from mutt using query_command, part of rolo"
arch=('i686' 'x86_64')
url="https://github.com/yourealwaysbe/mutt_vc_query"
license=('GPL')
depends=('libvc')
makedepends=('autoconf')
conflicts=(mutt_vc_query)
provides=(mutt_vc_query)
source=('git://github.com/yourealwaysbe/mutt_vc_query.git')
md5sums=('SKIP')

build() {
  cd $srcdir/mutt_vc_query
  autoreconf -f -i
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/mutt_vc_query
  make DESTDIR="$pkgdir" install
}

