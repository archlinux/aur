# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cpanplus-dist-build'
pkgver='0.86'
pkgrel='1'
pkgdesc="CPANPLUS plugin to install packages that use Build.PL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanplus>=0.84' 'perl-module-build>=0.32' 'perl')
makedepends=()
url='https://metacpan.org/release/CPANPLUS-Dist-Build'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-Dist-Build-0.86.tar.gz')
md5sums=('21792531f8c8f0dc0a5d6f6d528a1968')
sha512sums=('dc895e489c5a261f619fdd7f6f53bd98a52bfb89938b09d8ebf2bfa1ed9be17aaf11636969b868de4ce6760baf49e5c46a329a2dbd15fa3a59d1c98556a5237f')
_distdir="CPANPLUS-Dist-Build-0.86"

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
