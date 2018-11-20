# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=skafos
pkgver=1.7.7
pkgrel=1
pkgdesc="Command line utility to the Metis Machine platform"
arch=(x86_64)
url="https://metismachine.com"
license=('Apache')
depends=('yaml-cpp>=0.6.0' 'libarchive>=3.3.2' 'libgit2>=1:0.26.0' 'curl>=7.0.0' 'libcurl-compat>=7.0.0')
makedepends=('cmake>=3.0')
install=skafos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MetisMachine/$pkgname/archive/$pkgver.tar.gz")
md5sums=('60dac4226e39bfc5584aab259d97b20b')
sha1sums=('629dd75a733b83447ee18af51c836818890708d2')
sha256sums=('42eecd6094126f1e4febf94541c4b640f2b4ed39829af2686cd83a60fafcd994')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make build_dist
}

package() {
	cd "$pkgname-$pkgver"
	install -D _build/bin/skafos $pkgdir/usr/bin/$pkgname
}
