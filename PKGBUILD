# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpf'
pkgver='0.42'
pkgrel='1'
pkgdesc="perl interface to the GMP library's floating point (mpf) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPf'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-GMPf-$pkgver.tar.gz")
md5sums=('aa615b3f5aa233ed598b157749e17642')
sha512sums=('880a15b03711ba741227607530213793925a3980c98f7ad77fc229959f3a2abe11bfea1fdb1e0b8c37d4248d85a1f25d01a33ab04d359f9f9e903e90526776aa')
_distdir="Math-GMPf-$pkgver"

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
