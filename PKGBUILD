# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-github'
pkgver='0.82'
pkgrel='1'
pkgdesc="Perl Interface for github.com"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-lru' 'perl-http-message' 'perl-json-maybexs' 'perl-lwp-protocol-https' 'perl-moo' 'perl-type-tiny' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/Net-GitHub'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Net-GitHub-0.82.tar.gz')
md5sums=('e9f36d2432ca8ee4f71eb9032e31172d')
sha512sums=('38212fd11971007fedb3621538b7779f50305c94e54bb1ba2ac207350682bba2f60f1b0ecc80914e597d84bffdf6368b1f7723bda2344b986b1e26700ddb88fd')
_distdir="Net-GitHub-0.82"

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
