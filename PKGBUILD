# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

_cpan_name=HTTP-Server-Simple-Authen
_cpan_desc='Authentication plugin for HTTP::Server::Simple'
_cpan_author=miyagawa
_cpan_version=0.04
_cpan_md5=5dc1d5206e853fb66828341d938c5544

pkgrel=1
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=('5dc1d5206e853fb66828341d938c5544')
depends=('perl-http-server-simple' 'perl-authen-simple')
makedepends=('')
checkdepends=('perl-test-most')

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="http://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
options=(!emptydirs)
arch=('any')

build() {
    cd $srcdir/${_cpan_name}-$pkgver
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
    make test
}

package() {
    cd $srcdir/${_cpan_name}-$pkgver
    make install DESTDIR=$pkgdir
}
