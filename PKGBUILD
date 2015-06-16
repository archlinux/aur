# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-debug-client'
pkgver='0.29'
pkgrel='1'
pkgdesc="debugger client side code for Padre, The Perl IDE."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=1.96' 'perl-term-readline-gnu>=1.2' 'perl>=5.10.1')
makedepends=('perl-file-homedir')
checkdepends=('perl-test-checkdeps>=0.006' 'perl-test-class>=0.39' 'perl-test-deep>=0.11' 'perl-test-requires>=0.07')
url='http://search.mcpan.org/dist/Debug-Client'
source=('http://search.mcpan.org/CPAN/authors/id/B/BO/BOWTIE/Debug-Client-0.29.tar.gz')
md5sums=('85aab3e367b8f4aff1b527cbaa28d88e')
sha512sums=('32c5adcc11cf32d729fd027e6cc5c2129d2375391cee4321b29a508029da3054fbc84fae4e84674bf0eac2740f431c9d41d3059e48e4e4963be4bdaa29ebd17e')
_distdir="Debug-Client-0.29"

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
