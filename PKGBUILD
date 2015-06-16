# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-snowball-norwegian'
pkgver='1.2'
pkgrel='1'
pkgdesc="Porters stemming algorithm for norwegian."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Snowball-Norwegian'
source=('http://search.cpan.org/CPAN/authors/id/A/AS/ASKSH/Snowball-Norwegian-1.2.tar.gz')
md5sums=('24197e600ea4d9b5bb5ca9c175f14676')
sha512sums=('a14da012954076c6c3fdaa4ea12dd74d8e07e96e061e368980781c965e72fe9f8ac4b9bc8eb761e232bf8c244edc816f6c991bb2cd02020919fe957cefe034d5')
_distdir="Snowball-Norwegian-1.2"

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
