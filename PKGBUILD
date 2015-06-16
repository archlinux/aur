# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-www-curl-simple'
pkgver='0.100191'
pkgrel='1'
pkgdesc="A Simpler interface to WWW::Curl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-moose' 'perl-www-curl' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-test-exception')
url='http://search.mcpan.org/dist/WWW-Curl-Simple'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDREMAR/WWW-Curl-Simple-0.100191.tar.gz')
md5sums=('34f7092fd10c6c7e8c267e5bc45a76c6')
sha512sums=('fa8d488c1e6ad48bb6976aae76921101271ceb09c34a58fceaba7d4666723106b7750dc3eebb8e1dcf79a4dca8a0cb61d096fa282208dd32949a58a36ab6cb88')
_distdir="WWW-Curl-Simple-0.100191"

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
