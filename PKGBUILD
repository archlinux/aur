# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-cover'
pkgver='1.23'
pkgrel='1'
pkgdesc="Code coverage metrics for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Devel-Cover'
source=('http://search.cpan.org/CPAN/authors/id/P/PJ/PJCJ/Devel-Cover-1.23.tar.gz')
md5sums=('cddff9d89521078d241cd57d6790a8cb')
sha512sums=('075a89950f2b02aaae085d99b9fd6c8e52b173aa0ed46dc57980ca8fea9d6f6ec63fe776789d9436bfdd719c7701bad5b741e75e898582f1ceb3d0098e4574a3')
_distdir="Devel-Cover-1.23"

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
