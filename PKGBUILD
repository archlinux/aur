# $ID$
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=perl-date-simple
_dist=Date-Simple
pkgver=3.03
pkgrel=1
pkgdesc="Perl module for simple Date objects"
arch=('i686' 'x86_64')
url='https://metacpan.org/release/${_dist}'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/I/IZ/IZUT/${_dist}-${pkgver}.tar.gz)
md5sums=('436049dc2c7dfd8423d8bcc807248b31')
sha512sums=('3e64a0ba224427e688a45945860fd5e876e6ca5b01298e744e257981ed84d933ab14c9ab8d5b74316c031ffa9821afd9563270109cba20a5939f14af2dde8668')

build() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
}

package() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
