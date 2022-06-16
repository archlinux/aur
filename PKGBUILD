# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-cover'
pkgver='1.38'
pkgrel='1'
pkgdesc="Perl/CPAN Module Devel::Cover: Code coverage metrics for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-debug-cpan>=1.26' 'perl-html-parser')
makedepends=()
checkdepends=()
url='https://metacpan.org/release/Devel-Cover'
source=("http://search.cpan.org/CPAN/authors/id/P/PJ/PJCJ/Devel-Cover-$pkgver.tar.gz")
md5sums=('4bf351e64de779823bfffbc24ac0935a')
sha512sums=('3e4f1b625bd1b34afe93003c6e83189f1722b3e6392dccf3a1d28ecd7be943ad9af69c5a798ec7a9a604a18d2433fc4f406b2623315ed416ce110191cdf17bc1')
_distdir="Devel-Cover-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
