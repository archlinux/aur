# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-rai'
pkgver='1.3031'
pkgrel='1'
pkgdesc="RSS Abstraction Interface."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken>=1.02' 'perl-timedate' 'perl-xml-rss-parser>=4')
makedepends=('perl-test-weaken')
url='http://search.cpan.org/dist/XML-RAI'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMA/XML-RAI-1.3031.tar.gz')
md5sums=('821a7b05c465227cd0f1a61879fc1aef')
sha512sums=('bbeeb22124e90999c316464e707a3c35ed51a68552247d15b5c7ba4c297741535f51d0a24ea3038149f422ab492990960d13751ecbfa2ca4975dfd4dfc9d9a31')
_distdir="XML-RAI-1.3031"

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
