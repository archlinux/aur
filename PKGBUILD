# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=perl-net-rendezvous-publish
_cpname=Net-Rendezvous-Publish
pkgver=0.04
pkgrel=3
pkgdesc="Net::Rendezvous::Publish - publish Rendezvous services"
arch=('any')
url="https://metacpan.org/pod/${_cpname//-/::}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/R/RC/RCLAMP/$_cpname-$pkgver.tar.gz")
sha256sums=('deb75ee5a2ffacb41b08ff8798972d0cd5ad338494653d5eae4100041a8d247f')

build() {
    cd "$_cpname-$pkgver"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "$_cpname-$pkgver"
    make install DESTDIR="$pkgdir/"
}
