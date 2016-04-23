# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-accessor-lite'
pkgver='0.08'
pkgrel='1'
pkgdesc="a minimalistic variant of Class::Accessor"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-Accessor-Lite'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Class-Accessor-Lite-0.08.tar.gz')
md5sums=('6ed2f281887efa598183433c09695489')
sha512sums=('e23afed2c0c7eb887d23c80dca1b8b0cc42d38c86f8fcceb87d384b10403e0d74d3ae3b41a9654f4fcb58462ec138f0266a0b7e94d389ecb91d271600c6e293b')
_distdir="Class-Accessor-Lite-0.08"

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
