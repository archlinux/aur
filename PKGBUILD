# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-anyevent-http'
pkgver='2.21'
pkgrel='1'
pkgdesc="simple but non-blocking HTTP/HTTPS client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=5.33' 'perl-common-sense>=3.3')
makedepends=()
url='http://search.mcpan.org/dist/AnyEvent-HTTP'
source=('http://search.mcpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-HTTP-2.21.tar.gz')
md5sums=('bbd8b067a5de3dcb1be865e84993cfc7')
sha512sums=('c3b940d9b419102bf49b8c38f991e350ca25eaf87255e1de6c49f1172091e8c0cb692d191e406f80ac05f77297b7c95fdb551893bbea02b0d18e08374a30b0e4')
_distdir="AnyEvent-HTTP-2.21"

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
