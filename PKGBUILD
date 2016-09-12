# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-runtime-conflicts'
pkgver='0.003'
pkgrel='1'
pkgdesc="Provide information on conflicts for Module::Runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-checkconflicts' 'perl-module-runtime' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Module-Runtime-Conflicts'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Runtime-Conflicts-0.003.tar.gz')
md5sums=('67aaf699072063cc00c5b6afd4c67a6f')
sha512sums=('1b72ea7cc9516721290d5ea433169697b4134b5fc77872d6822e4c395a154bf956d469ab5da2802d587d60dfb13b9784014fe492988cf3f8b5820da2d63e8ca1')
_distdir="Module-Runtime-Conflicts-0.003"

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
