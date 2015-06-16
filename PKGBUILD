# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-devel-partialdump'
pkgver='0.17'
pkgrel='1'
pkgdesc="Partial dumping of data structures, optimized for argument printing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-sub-exporter' 'perl-test-use-ok' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-test-warn')
url='http://search.mcpan.org/dist/Devel-PartialDump'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Devel-PartialDump-0.17.tar.gz')
md5sums=('c076e685aa184dede1454b3bea3430fa')
sha512sums=('c473341a7c3e8b26ec56b90fa868cace4f5ebf612176a0bbb3c904ec488c4f6779ac26b8417fa9c18a6b6c98149718f5b7b90d0e8e0ec8cbf4bbdc1de6d279de')
_distdir="Devel-PartialDump-0.17"

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
