# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-graphics-framebuffer'
pkgver='5.79'
pkgrel='1'
pkgdesc="A Simple Framebuffer Graphics Library"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-imager>=0.91' 'perl-math-bezier>=0.01' 'perl-math-gradient>=0.03' 'perl-sys-mmap>=0.16' 'perl>=5.01')
makedepends=()
checkdepends=('perl-test-most>=0.30')
url='https://metacpan.org/release/Graphics-Framebuffer'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKELSCH/Graphics-Framebuffer-5.79.tar.gz')
md5sums=('f30e6f59df4c9d138ddf60f3994cfd74')
sha512sums=('196e286c6397407655fe23d85d88988a3c089844adf143c6a9ceaddc33e0809eae830b5a8b5df6e1fb5ef2a2ce54a8d86bd667eb27154650f76de7df0fd9eb6c')
_distdir="Graphics-Framebuffer-5.79"

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
