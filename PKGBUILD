# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-github'
pkgver='0.79'
pkgrel='1'
pkgdesc="Perl Interface for github.com"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json-maybexs' 'perl-lwp-protocol-https' 'perl-moo' 'perl-type-tiny' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/Net-GitHub'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Net-GitHub-0.79.tar.gz')
md5sums=('ecfe5cd746a074197250d65f1cb8aba0')
sha512sums=('f5a2bd2b74ef48738bd5a60850f34d62154b3fadfc8661f8562830ffd4e3a84a0b8b2c631969352fa74f43855a6ce6252ce50144280bb8b7a274483eea4e4514')
_distdir="Net-GitHub-0.79"

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
