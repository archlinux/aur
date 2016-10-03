# Maintainer: Pappy STĂNESCU <pappy@ascelion.com>

_cpan_name=Role-Basic
_cpan_desc="Just roles. Nothing else."
_cpan_author=ovid
_cpan_version=0.13
_cpan_md5=2985fbb47bd0a862bd56bc7cbba6e673

pkgrel=1
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
depends=('')
makedepends=('')
checkdepends=()

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="http://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
license=("GPL" "PerlArtistic")
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

