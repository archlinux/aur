# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-constant-lexical'
pkgver='2'
pkgrel='1'
pkgdesc="Perl pragma to declare lexical compile-time constants"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lexical-var')
makedepends=()
url='http://search.cpan.org/dist/constant-lexical'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/constant-lexical-2.tar.gz')
md5sums=('b80916a698324b591af70cd2d7354129')
sha512sums=('e9bac0e0e7d02d29dfca59b4841f56392354b0f0349008a1b4fa51554ec732ddab60157e0094df3441c91a2dcead92d4f57e41076e0d4ea8bd5afc47e227bfdb')
_distdir="constant-lexical-2"

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
