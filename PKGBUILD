# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-sane
pkgver=0.14
pkgrel=2
pkgdesc="Perl extension for the SANE (Scanner Access Now Easy) Project"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'sane' 'perl-extutils-depends' 'perl-extutils-pkgconfig' 'perl-readonly' 'perl-test-requires' 'perl-exception-class' 'perl-try-tiny')
url='https://cpan.metacpan.org/authors/id/R/RA/RATCLIFFE/Image-Sane-0.14.tar.gz'
source=('https://cpan.metacpan.org/authors/id/R/RA/RATCLIFFE/Image-Sane-0.14.tar.gz')
md5sums=('5a8687379630a272cacbcb52d66ae65a')
sha512sums=('d08be5f0d18f367178b7d76d50abe12faaba48525374c782f6a91fdb44d314b1943617bab9f6e7b2bbbf4c95dcc221bfbd92cdf7c80783916aad24daf5b04bea')
_distdir="Image-Sane-0.14"

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
