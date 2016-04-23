# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-unicode-normalize'
pkgver='1.25'
pkgrel='1'
pkgdesc="Unicode Normalization Forms"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Unicode-Normalize'
source=('http://search.cpan.org/CPAN/authors/id/K/KH/KHW/Unicode-Normalize-1.25.tar.gz')
md5sums=('8f25327bbccc33717b7d85433e1083bd')
sha512sums=('f28c19e0293cf75cc0aab669ae0a0543f6a1a39e1e50ff32ab37abd8e85efc73e8b9075e581212b6da576ecbf8c0e9ddb7b9b352674aa3a04c77f9aaf4717866')
_distdir="Unicode-Normalize-1.25"

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
