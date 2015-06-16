# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-en-inflect'
pkgver='1.895'
pkgrel='1'
pkgdesc="Convert singular to plural. Select \"a\" or \"an\"."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-EN-Inflect'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Lingua-EN-Inflect-1.895.tar.gz')
md5sums=('96ce4517a21800a6e90df1f4cdd515a5')
sha512sums=('f077d638840e700ebddce37952f89a002a2b67610eb86475a4e86b9f64cf89fac4b8e68c75c6739ac4fcfb4b6d5cc12491b2bf892ad08000f7bc38c509461eaf')
_distdir="Lingua-EN-Inflect-1.895"

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
