# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=perl-net-bonjour
_cpname=Net-Bonjour
pkgver=0.96
pkgrel=4
pkgdesc="Net::Bonjour - Module for DNS service discovery (Apple's Bonjour)"
arch=(any)
url="https://metacpan.org/pod/${_cpname//-/::}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-net-dns')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHLIGE/$_cpname-$pkgver.tar.gz")
sha256sums=('c38a1f3ab200b08208d0c3a02b23d30653dfc62c09c6a12561c6ea08a69b1f97')

build() {
    cd "$_cpname-$pkgver"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "$_cpname-$pkgver"
    make install DESTDIR="$pkgdir/"
}
