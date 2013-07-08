# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-net-dbus-git
_pkgname=perl-net-dbus
_gitname=net-dbus
pkgver=20130708
pkgrel=1
pkgdesc="Binding for DBus messaging protocol"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Net-DBus"
license=('GPL' 'PerlArtistic')
depends=('dbus' 'perl-xml-twig')
makedepends=('git')
options=('!emptydirs')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git://gitorious.org/$_gitname/$_gitname.git")
md5sums=('SKIP')

build() {
  cd $_gitname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
