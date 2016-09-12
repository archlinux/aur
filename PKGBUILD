# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-scalar-list-utils'
pkgver='1.45'
pkgrel='1'
pkgdesc=""
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Scalar-List-Utils'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.45.tar.gz')
md5sums=('b469e990ec92a4c9386aaf9e92857ae9')
sha512sums=('879df4137205dc4c41d996fb33a0afe656499f3a6666617723fcf4c5fd74d08d150562d54da248285757990c23c1fcf7c63c20cf270e62f86f3c0a8b97535ad5')
_distdir="Scalar-List-Utils-1.45"

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
