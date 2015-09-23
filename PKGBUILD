# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-www-tumblr'
pkgver='5.2'
pkgrel='1'
pkgdesc="Perl bindings for the Tumblr API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json' 'perl-moose' 'perl-net-oauth' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/WWW-Tumblr'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMOG/WWW-Tumblr-5.2.tar.gz')
md5sums=('b5ebb03dc48890e0294d6cb867725405')
sha512sums=('ef017145437dd2eccb0e593da3374b32d95ebb641de0cd3e3d21896b3709d67efd0376c0a2ef92d235c7e368082d5a1a30ab588c2c673988fbce37a7538c673e')
_distdir="WWW-Tumblr-5.2"

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
