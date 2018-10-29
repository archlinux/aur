# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=skafos
pkgver=1.7.6
pkgrel=1
pkgdesc="Command line utility to the Metis Machine platform"
arch=(x86_64)
url="https://metismachine.com"
license=('Apache')
depends=('yaml-cpp>=0.6.0' 'libarchive>=3.3.2' 'libgit2>=1:0.26.0' 'curl>=7.0.0' 'libcurl-compat>=7.0.0')
makedepends=('cmake>=3.0')
install=skafos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MetisMachine/$pkgname/archive/$pkgver.tar.gz")
md5sums=('69229ff8559061adcea98dfc265c152a')
sha1sums=('bcf0696da4df1d820ed14fe6276c786961e223f4')
sha256sums=('c82ffdca0a7317f4f47947ed894a1fd0e54f333e09cebab7158e545aef766b5e')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make build_dist
}

package() {
	cd "$pkgname-$pkgver"
	install -D _build/bin/skafos $pkgdir/usr/bin/$pkgname
}
