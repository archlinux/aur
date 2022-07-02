# Maintainer: Alad Wenter <alad at archlinux dot org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-debug-client
pkgver=0.31
pkgrel=1
pkgdesc="debugger client side code for Padre, The Perl IDE."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=1.96' 'perl-term-readline-gnu>=1.2' 'perl')
makedepends=('perl-file-homedir')
checkdepends=('perl-test-checkdeps>=0.006' 'perl-test-class>=0.39' 'perl-test-deep>=0.11' 'perl-test-requires>=0.07')
url='https://metacpan.org/release/Debug-Client'
source=("https://cpan.metacpan.org/authors/id/M/MA/MANWAR/Debug-Client-$pkgver.tar.gz")
sha256sums=('7eecada7346725313c37dc3a29dcc9697f645068d9607d9109c639db03456ca0')
_distdir="Debug-Client-$pkgver"

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
