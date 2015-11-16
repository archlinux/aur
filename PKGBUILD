# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-padwalker'
pkgver='2.2'
pkgrel='1'
pkgdesc="play with other peoples' lexical variables"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/PadWalker'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROBIN/PadWalker-2.2.tar.gz')
md5sums=('6bcc741f77b1831a893b2a22c785e31a')
sha512sums=('b0bdfd4f1ebf63e71618dda0db6249fc6b4a0165cc829a9a90e68353f31b61ec6c5873b598b67b085f0a7fb8be40fd1f890e57de85dfdd1bee5543146cc1a3f3')
_distdir="PadWalker-2.2"

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
