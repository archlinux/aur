# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-html-formhandler'
pkgver='0.40057'
pkgrel='1'
pkgdesc="HTML forms using Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.06' 'perl-data-clone' 'perl-datetime' 'perl-datetime-format-strptime' 'perl-email-valid' 'perl-file-sharedir' 'perl-html-tree' 'perl-json' 'perl-list-allutils>=0.07' 'perl-moose>=2.0007' 'perl-moosex-getopt>=0.16' 'perl-moosex-types>=0.20' 'perl-moosex-types-common' 'perl-moosex-types-loadableclass>=0.006' 'perl-padwalker' 'perl-sub-exporter' 'perl-sub-name' 'perl-try-tiny' 'perl-aliased' 'perl-namespace-autoclean>=0.09')
makedepends=()
checkdepends=('perl-test-differences' 'perl-test-exception' 'perl-test-memory-cycle>=1.04')
url='http://search.mcpan.org/dist/HTML-FormHandler'
source=('http://search.mcpan.org/CPAN/authors/id/G/GS/GSHANK/HTML-FormHandler-0.40057.tar.gz')
md5sums=('9ff1c3a4353f7ddb9578aa2030ae4b62')
sha512sums=('b337e0af6d298a8b1bc2483c3190f826c6fbce74b953049d8d6510ba691ae6cf3ec6cfc18c52e7f8118a6c69af1028d37b3220154163456a69c0c28f3b360e78')
_distdir="HTML-FormHandler-0.40057"

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
