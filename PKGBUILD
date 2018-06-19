# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=skafos
pkgver=1.5.5
pkgrel=1
pkgdesc="Command line utility to the Metis Machine platform"
arch=(x86_64)
url="https://metismachine.com"
license=('Apache')
depends=('yaml-cpp>=0.6.0' 'libarchive>=3.3.2' 'libgit2>=1:0.26.0' 'curl>=7.0.0' 'libcurl-compat>=7.0.0')
makedepends=('cmake>=3.0')
install=skafos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MetisMachine/$pkgname/archive/$pkgver.tar.gz")
md5sums=('40661676544cd48b233f0ac2949f56fa')
sha1sums=('b3562dc53924b2a7ca4fd227eaf2f05d84911a45')
sha256sums=('1d234fbd65b8943aa875cc02faf967c2b853cfe05ca98d755efd5bd211339820')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make build_dist
}

package() {
	cd "$pkgname-$pkgver"
	install -D _build/bin/skafos $pkgdir/usr/bin/$pkgname
}
