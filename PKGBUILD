# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-role-withoverloading'
pkgver='0.17'
pkgrel='1'
pkgdesc="(DEPRECATED) Roles which support overloading"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.94' 'perl-aliased' 'perl-namespace-autoclean>=0.16' 'perl-namespace-clean>=0.19' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooseX-Role-WithOverloading'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Role-WithOverloading-0.17.tar.gz')
md5sums=('df0bb5ecaacdcccea121797b9825f612')
sha512sums=('510c243dc561b82ee50934e802e697d1fcd4db35c6a4cd8044f5cd5668c890e38a6ba38648f8ca0f11ac55dfddc3d4fa94f2e6ed90871547d76e3b5953e54155')
_distdir="MooseX-Role-WithOverloading-0.17"

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
