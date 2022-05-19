# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-devel-declare'
pkgver='0.006022'
pkgrel='1'
pkgdesc="Adding keywords to perl, in perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope>=0.05' 'perl-b-hooks-op-check>=0.19' 'perl-sub-name' 'perl')
makedepends=(perl-extutils-depends)
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/Devel-Declare'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Devel-Declare-$pkgver.tar.gz")
md5sums=('664646c5872e233f640ca6bb8e84714d')
sha512sums=('05b226fdc18a69e0590087d1daeca111af86c3a6865477cb203701e1c8f4a5a03e919f4c6661252ef0ee4204a71667b36caf061374d67a8508dafe4dce155a1e')
_distdir="Devel-Declare-$pkgver"

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
