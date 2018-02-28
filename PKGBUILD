# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-identify'
pkgver='0.56'
pkgrel='1'
pkgdesc="Language identification"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-factory-util>=1.6' 'perl-text-affixes>=0.07' 'perl-text-ngram>=0.13')
makedepends=()
url='https://metacpan.org/release/Lingua-Identify'
source=('http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Lingua/Lingua-Identify-0.56.tar.gz')
md5sums=('e6aa95abf743ed3ec6b5b5a0b8e48a77')
sha512sums=('f8d7f275cf698356d53407843f83d988cd36d39a542a5f09fded0219227a57612860c9a16f7ec27705e4fe143608cf5fc6597e7d7ddcef9857e658aac55766fc')
_distdir="Lingua-Identify-0.56"

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
