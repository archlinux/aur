# Maintainer: Pappy STĂNESCU <pappy _AT_ a s c e l i o n _DOT_ com>

_cpan_name=HTTP-Server-Simple-Static
_cpan_desc='Serve static files with HTTP::Server::Simple'
_cpan_author=sjquinney
_cpan_version=0.12
_cpan_md5=4ef0085b300a1e001b76b484d724e0d3

pkgrel=1
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
depends=('perl-http-server-simple' 'perl-http-date')
makedepends=('')
checkdepends=()

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

