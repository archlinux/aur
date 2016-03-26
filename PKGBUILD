# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-constant-lexical'
pkgver='2.0001'
pkgrel='1'
pkgdesc="Perl pragma to declare lexical compile-time constants"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-delete')
makedepends=()
url='https://metacpan.org/release/constant-lexical'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/constant-lexical-2.0001.tar.gz')
md5sums=('b57c844e2f3b39d08d0663c9bc70e033')
sha512sums=('e15a1ab087adfb5c55a9999afc8f85592d9da6ca2505a043e12a83d1ac8277e457309845013bd7edfc91ec5f4cacc03963df04cb31cef651f3a05abdafffa734')
_distdir="constant-lexical-2.0001"

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
