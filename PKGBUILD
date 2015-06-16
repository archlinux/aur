# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-time-piece-mysql'
pkgver='0.06'
pkgrel='1'
pkgdesc="Adds MySQL-specific methods to Time::Piece"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Time-Piece-MySQL'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KASEI/Time-Piece-MySQL-0.06.tar.gz')
md5sums=('be66a577f8790c16947d8e3e5a0e65a2')
sha512sums=('8f748b50a763dbe4b0a545d6bb96f9ccffa05da48461c0fac63e89ba6029856ac60b871264217b820408aefa2dd4fdcbba036f5ad6ad9281f6699e33003f36e4')
_distdir="Time-Piece-MySQL-0.06"

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
