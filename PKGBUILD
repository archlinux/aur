# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=perl-io-termios
_realname=IO-Termios
pkgver=0.05
pkgrel=1
pkgdesc="Perl/CPAN IO::Termios module - supply termios(3) methods to IO::Handle objects"
arch=('any')
license=('PerlArtistic' 'GPL')
url="http://search.cpan.org/dist/${_realname}/"
makedepends=('perl' 'perl-test-longstring')
depends=('perl')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/P/PE/PEVANS/${_realname}-${pkgver}.tar.gz")
sha512sums=('e94f1be86f28c6f04c001df13f569c5ea7f8e5c3cc76d46b5901c0040e7f8f50e78389b98f7a645cc106f5f620716687d2046ffdebaf33619879f45a98cbe0e8')

build() {
    cd "${srcdir}/${_realname}-${pkgver}"
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    cd "${srcdir}/${_realname}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${_realname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
