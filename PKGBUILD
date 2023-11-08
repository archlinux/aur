# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-schedule-cron'
pkgver='1.05'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-time-parsedate>=2011.0505')
makedepends=()
url='https://metacpan.org/release/Schedule-Cron'
source=('http://search.cpan.org/CPAN/authors/id/N/NH/NHUBBARD/Schedule-Cron-1.05.tar.gz')
md5sums=('098e67fa4afdeed6867021efd9ecce74')
sha512sums=('0ae856833f867f84cb2fe553d03279e6b82312725f732cb537f189da99ac300da464c4cc53cd0d0961c6ba44e396ed18f07e868261fbf12db3ef19160bd8152b')
_distdir="Schedule-Cron-1.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
