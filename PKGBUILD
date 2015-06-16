# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-padwalker'
pkgver='2.0'
pkgrel='1'
pkgdesc="play with other peoples' lexical variables"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/PadWalker'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROBIN/PadWalker-2.0.tar.gz')
md5sums=('9d602cf26e3e9086865a57708b2a0db2')
sha512sums=('9ad282f0f37f3dfec5eb93df1c10d75380fdcda2291ad6945e62581a01b7b1ca3b1e3a5633e371068aaa00a58aa925ce79010068fbee2faf14d3d89940b26e51')
_distdir="PadWalker-2.0"

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
