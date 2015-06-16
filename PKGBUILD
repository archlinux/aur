# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-library-callnumber-lc'
pkgver='0.22'
pkgrel='1'
pkgdesc="Deal with Library-of-Congress call numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Library-CallNumber-LC'
source=('http://search.cpan.org/CPAN/authors/id/D/DB/DBWELLS/Library-CallNumber-LC-0.22.tar.gz')
md5sums=('b25acaa6354e38b7623e084a1f9ce40a')
sha512sums=('09dfda7c0b7ce549db583fd5a5a1fca726a2ef58cff150edc34861d872edbe0ac286071d6950d39d18e7b4aceef4d7db298c6f66736d019b859e420d14991cf8')
_distdir="Library-CallNumber-LC-0.22"

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
