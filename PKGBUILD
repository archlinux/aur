# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-cover'
pkgver='1.29'
pkgrel='1'
pkgdesc="Perl/CPAN Module Devel::Cover: Code coverage metrics for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Devel-Cover'
source=("http://search.cpan.org/CPAN/authors/id/P/PJ/PJCJ/Devel-Cover-$pkgver.tar.gz")
md5sums=('dff8b33f7645dbd34070aaf46df63e62')
sha512sums=('dd2b75a411f67eb054fa16ef0f9d327fe9d41368ef6f0436bfbf13303bf3bc9eb28f6caea101b3b226f7a9d483f2db419a60a39ea8df1733e1e49eb9d39b2c7b')
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
