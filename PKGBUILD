# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-data-util'
pkgver='0.63'
pkgrel='1'
pkgdesc="A selection of utilities for data and data types"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-hash-util-fieldhash-compat' 'perl-scope-guard')
checkdepends=('perl-test-exception>=0.27')
url='https://metacpan.org/release/Data-Util'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/Data-Util-0.63.tar.gz')
md5sums=('7d4fa4df6f94156b7f25b64397a68636')
sha512sums=('bc2b10a7881e475e27f51aeed567f57dec7d428eec19349672ec363ba0acb617f72f633ec99b491930b0c9f143a457598d0faebf6ef092fc79cfb88d9081a998')
_distdir="Data-Util-0.63"

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
