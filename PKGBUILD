# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=perl-linux-smaps
_pkgname=Linux-Smaps
pkgver=0.13
pkgrel=5
pkgdesc='Linux::Smaps - a Perl interface to /proc/PID/smaps'
arch=('any')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_pkgname}/"
depends=('perl' 'perl-class-member')
changelog="ChangeLog"
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/O/OP/OPI/${_pkgname}-$pkgver.tar.gz)
md5sums=('28bbe178b1b26935c454fa8ccdd16929')

build() {
  cd $_pkgname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make INSTALLDIRS=vendor
}

package() {
  cd $_pkgname-$pkgver
  make INSTALLDIRS=vendor DESTDIR="$pkgdir" install
  rm -fr "$pkgdir/usr/lib"
}
