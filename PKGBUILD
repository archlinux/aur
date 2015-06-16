# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-hijk'
pkgver='0.20'
pkgrel='1'
pkgdesc="Fast & minimal low-level HTTP client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-plack')
makedepends=()
checkdepends=('perl-test-exception')
url='https://metacpan.org/release/Hijk'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Hijk-0.20.tar.gz')
md5sums=('a990eacd2f8ebd009630dbaa57f07dfe')
sha512sums=('4e442f898fc4f557bf80f5263a11ac9cbc04da56bb78ac48ce97324b305e1525790abb5d8af267bf55d28d2ef1155f15b5fd97a85fad1ba1536d33966277d201')
_distdir="Hijk-0.20"

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
