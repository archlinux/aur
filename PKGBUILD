# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-sharedfork'
pkgver='0.33'
pkgrel='1'
pkgdesc="fork test"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-requires' 'perl')
makedepends=()
url='https://metacpan.org/release/Test-SharedFork'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-SharedFork-0.33.tar.gz')
md5sums=('5e9445ea773211f743ac0f64e276f70d')
sha512sums=('3218023d48b05c31bfba8d9629f8acb1379c91efa7713187741fd9851c8c645ec62143025d7c0038e5d52a3fbd21cac6030e15c816745de5461a40529ceb4bf3')
_distdir="Test-SharedFork-0.33"

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
