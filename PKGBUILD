# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-constant'
pkgver='1.33'
pkgrel='1'
pkgdesc="Perl pragma to declare constants"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/constant'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/constant-1.33.tar.gz')
md5sums=('4ee93d57fbd8dfbc4c902c495614d5f0')
sha512sums=('f1ec947a321c6a04be39e1b1ec50e44a6e9edd0ed5c4698ff2aa33218a85cde3c37b4641e6c98ee7b06015d4dbb32f8bbeccfba87b8ce88a08da062c216e5ec2')
_distdir="constant-1.33"

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
