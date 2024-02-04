# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-textile'
pkgver='2.13'
pkgrel='1'
pkgdesc="A humane web text generator."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Text-Textile'
source=('http://search.cpan.org/CPAN/authors/id/B/BC/BCHOATE/Text-Textile-2.13.tar.gz')
md5sums=('b502b1cca00ff9a26295a05e48710c2b')
sha512sums=('3803a51f21165964f4860e008124dc00e7b57279dc0be24ac90b98456776879c5269e6d25ca65980d03ca62a57c059caa1b725d48a22d628f72af390f341d605')
_distdir="Text-Textile-2.13"

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
