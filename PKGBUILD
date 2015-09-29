# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-module-path'
pkgver='0.19'
pkgrel='1'
pkgdesc="get the full path to a locally installed module"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-findperl' 'perl')
makedepends=()
url='https://metacpan.org/release/Module-Path'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Module-Path-0.19.tar.gz')
md5sums=('8f409cc8654c5b3896f5d2770e07ddab')
sha512sums=('fa71c67f6e8daab9df29a6ced09c557980873ea73ed6e9c28081d10009d153767adc24ddd6acbde0c1423ffbf9cc92f8ab5db29203b73a79643dfc98fc2b2935')
_distdir="Module-Path-0.19"

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
