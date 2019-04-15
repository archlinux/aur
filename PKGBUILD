# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=ocs-store
pkgver=3.5.0
pkgrel=1
pkgdesc="Store Frontend and Management Application based on OpenCollaborationServices (OCS) of Opendesktop.org."
arch=('x86_64')
url="https://git.opendesktop.org/akiraohgaki/ocs-store"
license=('GPL3')
depends=('gconf' 'gtk3' 'libxss' 'nodejs' 'nss')
makedepends=('npm')
conflicts=('ocsstore')
source=("$pkgname-$pkgver.tar.gz::https://git.opendesktop.org/akiraohgaki/$pkgname/-/archive/release-$pkgver/$pkgname-release-$pkgver.tar.gz")
sha256sums=('084888767c30bb6682bfc8df8c72a8df2207aaff20dd7adc049d70827f71a284')

build() {
    cd "$pkgname-release-$pkgver"
    make
}

package() {
    cd "$pkgname-release-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir/" install
}
