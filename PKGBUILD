# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-name-fromline'
pkgver='0.11'
pkgrel='1'
pkgdesc="Auto fill test names from caller line"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-slurp' 'perl-test-differences' 'perl-test-fatal')
makedepends=()
url='http://search.cpan.org/dist/Test-Name-FromLine'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SATOH/Test-Name-FromLine-0.11.tar.gz')
md5sums=('e7e7637079d127b411738aeff5612502')
sha512sums=('4aa22fd1ac646ac39c56285d37d949680a83eb0462300d679f6aa8e112a471f7f73ba27228916d3b88ba7ae81c5647914226670e6d92beee5617430d47efa8c7')
_distdir="Test-Name-FromLine-0.11"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
