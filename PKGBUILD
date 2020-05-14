# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=perl-math-vectorreal
pkgver=1.02
pkgrel=1
pkgdesc="Module to handle 3D Vector Mathematics"
_dist="Math-VectorReal"
arch=(any)
url="https://metacpan.org/pod/Math::VectorReal"
license=(GPL PerlArtistic)
depends=(perl)
options=(purge !emptydirs)
source=("https://cpan.metacpan.org/authors/id/A/AN/ANTHONY/${_dist}-${pkgver}.tar.gz")
md5sums=('9eacc7b8dffeedd1d9cce2ed1c803ba4')

build() {
    cd "${srcdir}/${_dist}-${pkgver}"
    
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${_dist}-${pkgver}"

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
  
    make test
}

package() {
    cd "${srcdir}/${_dist}-${pkgver}"

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
