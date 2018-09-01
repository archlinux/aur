# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=perl-class-accessor-lvalue
_cpname=Class-Accessor-Lvalue
pkgver=0.11
pkgrel=3
pkgdesc='TClass::Accessor provides lvalue accessor makers'
arch=('any')
url="https://metacpan.org/pod/${_cpname//-/::}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/R/RC/RCLAMP/$_cpname-$pkgver.tar.gz")
sha256sums=('ea5b1bcfbc1c3c63004eb280a5415f7dad2a82257675ab033382814fe168913c')

build() {
    cd "$_cpname-$pkgver"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "$_cpname-$pkgver"
    make install DESTDIR="$pkgdir/"
}
