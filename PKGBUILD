# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-twiggy'
pkgver='0.1025'
pkgrel='1'
pkgdesc="AnyEvent HTTP server for PSGI (like Thin)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-http-message' 'perl-plack>=0.99' 'perl-try-tiny' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires' 'perl-test-tcp')
url='https://metacpan.org/release/Twiggy'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Twiggy-0.1025.tar.gz')
md5sums=('afd58d121cf96178d9dad8a5f30a6d57')
sha512sums=('72b811add821b57eefe3ad3e1df9dd11e00408c5c3daac25e3b3f748e25e0e294fa0e1d1795589e0cd125538c5ae46538a4f8c9e2810e59616c23405969c443f')
_distdir="Twiggy-0.1025"

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
