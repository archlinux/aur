# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-constant-boolean'
pkgver='0.02'
pkgrel='1'
pkgdesc="Define TRUE and FALSE constants."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-symbol-util>=0.02' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/constant-boolean'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/constant-boolean-0.02.tar.gz')
md5sums=('21cabbd2b4994bbc39881eed05f5eb53')
sha512sums=('80b2f6cb5f930a022ac51299e7a22b10db8641077a0977bda17efc43a8cc43eab7993274decc12440820a74fd0f11882536176c9129c45ade599552f8068329f')
_distdir="constant-boolean-0.02"

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
