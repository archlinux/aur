# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-graphics-framebuffer'
pkgver='4.1'
pkgrel='1'
pkgdesc="A Simple Framebuffer Graphics Library"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-imager' 'perl-switch' 'perl-sys-mmap' 'perl>=5.014')
makedepends=()
url='https://metacpan.org/release/Graphics-Framebuffer'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKELSCH/Graphics-Framebuffer-4.1.tar.gz')
md5sums=('8046a11a692b274e22b8905d9659235b')
sha512sums=('50aa769529ad8b5c5617e61726712ecc57aacd5a694faf0b2c19feca8a72e2321868607ae78f90ebeab9b8b6ac10081aa66cf9b4befed4b71f75a8f4ea051afc')
_distdir="Graphics-Framebuffer-4.1"

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
