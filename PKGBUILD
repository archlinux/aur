# Maintainer: Andras Wacha < awacha at gmail dot com >
# Submitter: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-tk-zinc
pkgver=3.306
pkgrel=2
pkgdesc='Another Canvas which proposes many new functions, some based on openGL'
arch=('i686' 'x86_64')
url='https://metacpan.org/dist/Tk-Zinc'
license=('PerlArtistic' 'GPL')
depends=('perl-tk' 'glu')
source=(https://cpan.metacpan.org/authors/id/A/AS/ASB/Tk-Zinc-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('3c3e646795e7ab3d45bdeada4566aa09')

build() {
  cd Tk-Zinc-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd Tk-Zinc-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd Tk-Zinc-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
