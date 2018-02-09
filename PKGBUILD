# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-anyevent-irc
pkgver=0.97
pkgrel=1
pkgdesc="An event system independend IRC protocol module"
arch=('any')
url="http://search.cpan.org/dist/AnyEvent-IRC/"
license=('GPL' 'PerlArtistic')
depends=('perl-anyevent' 'perl-object-event')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/E/EL/ELMEX/AnyEvent-IRC-$pkgver.tar.gz)
md5sums=('7bba2370468f4517b4ab04c2e4880047')

build() {
  cd AnyEvent-IRC-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd AnyEvent-IRC-$pkgver
  make DESTDIR="$pkgdir" install
}
