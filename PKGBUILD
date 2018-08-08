# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-cover'
pkgver='1.30'
pkgrel='1'
pkgdesc="Perl/CPAN Module Devel::Cover: Code coverage metrics for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
checkdepends=('perl-b-debug-cpan>=1.26')
url='https://metacpan.org/release/Devel-Cover'
source=("http://search.cpan.org/CPAN/authors/id/P/PJ/PJCJ/Devel-Cover-$pkgver.tar.gz")
md5sums=('969026a488340126b8e06b3345ae6696')
sha512sums=('be61c6af79a5ca99c200dd2105925fe4f6edda8df38c6391cacd3fc31e963aa5227a6b73cc68d6be220a61e9d744a97559ff5c152fe868c8dbf2af974c7175da')
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
