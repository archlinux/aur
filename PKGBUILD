# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-curry'
pkgver='1.001000'
pkgrel='1'
pkgdesc="Perl/CPAN Module curry: Create automatic curried method call closures for any class or object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/curry'
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/curry-$pkgver.tar.gz")
md5sums=('80feac47010dcc244bac64babfc2be52')
sha512sums=('1d934ceb64a73784484ac73a529f9f6cdd3cbcaff7175515ddce75bbc7933f2f3105f3a4ef12e33eb82db5792c435e32aae12f64b3e334064db4305910e86d14')
_distdir="curry-$pkgver"

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
