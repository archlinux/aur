# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-vcs-lite'
pkgver='0.12'
pkgrel='1'
pkgdesc="Minimal version control system"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-algorithm-diff>=1.13')
makedepends=()
url='https://metacpan.org/release/VCS-Lite'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/VCS-Lite-0.12.tar.gz')
md5sums=('2172c15dfd5beff450f2a8ca61a83d4e')
sha512sums=('1c9bc9cd6057e546c4b90acd1557305ad78f237e05fc3f55770af2ae1342c6c314004a26a01c076563161649ae54d00fb31629350ed56b18bfc430478f2b5b76')
_distdir="VCS-Lite-0.12"

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
