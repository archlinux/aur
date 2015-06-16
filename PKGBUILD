# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-has-options'
pkgver='0.003'
pkgrel='1'
pkgdesc="Succinct options for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-list-moreutils' 'perl-package-stash>=0.18' 'perl-string-rewriteprefix')
makedepends=('perl-moose' 'perl-namespace-autoclean' 'perl-test-most')
url='http://search.cpan.org/dist/MooseX-Has-Options'
source=('http://search.cpan.org/CPAN/authors/id/P/PS/PSHANGOV/MooseX-Has-Options-0.003.tar.gz')
md5sums=('c17d67c67dea5f6916f04ea398f55509')
sha512sums=('b66675bdf137c5b584b06296d23c46a14522304969cbf72d8b8efa873f8563b86b082155d92666b651abaf63bb060c295494d07889ed0aa6e5e56c321fd636b7')
_distdir="MooseX-Has-Options-0.003"

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
