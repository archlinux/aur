# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpq'
pkgver='0.44'
pkgrel='1'
pkgdesc="perl interface to the GMP library's rational (mpq) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPq'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-GMPq-$pkgver.tar.gz")
md5sums=('d8245b5fc4911d82f3142690f81f52b8')
sha512sums=('7c9a085f2afd85b63dc5fef580b70609c786fcabc043f6fcb940257c140f87e173ea235c6a96f126aab7ed910efaf3ddee58a713d06eca70556005682e37a9dd')
_distdir="Math-GMPq-$pkgver"

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
