# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-github'
pkgver='0.81'
pkgrel='1'
pkgdesc="Perl Interface for github.com"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-lru' 'perl-http-message' 'perl-json-maybexs' 'perl-lwp-protocol-https' 'perl-moo' 'perl-type-tiny' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/Net-GitHub'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Net-GitHub-0.81.tar.gz')
md5sums=('247caeaaa3a20a1ca160b4e93f60feac')
sha512sums=('786f0022b1196dafdc680ad0b57220887cb2abb1dc8c565dd80bb0631da28f2463d8a0cb7289057ed671c69e82eeb83d972e618b79089e23be90873a078ddd48')
_distdir="Net-GitHub-0.81"

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
