# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-perlio-utf8-strict'
pkgver='0.004'
pkgrel='1'
pkgdesc="Fast and correct UTF-8 IO"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-exception')
url='http://search.mcpan.org/dist/PerlIO-utf8_strict'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/PerlIO-utf8_strict-0.004.tar.gz')
md5sums=('b631c8a8a674e4f41a47307bc56a7f0b')
sha512sums=('6d1d75f6e371e787bb41cafd8e66eef693cafbef0032b1284783e3922121d1eafb49fe9ff5e7f70469fb468894c36b6d37b49c1f4348dd7c1fd4e2e3cca9ae0c')
_distdir="PerlIO-utf8_strict-0.004"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
