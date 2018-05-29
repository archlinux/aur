# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=skafos
pkgver=1.5.3
pkgrel=1
pkgdesc="Command line utility to the Metis Machine platform"
arch=(x86_64)
url="https://metismachine.com"
license=('Apache')
depends=('yaml-cpp>=0.6.0' 'libarchive>=3.3.2' 'libgit2>=1:0.26.0' 'curl>=7.0.0' 'libcurl-compat>=7.0.0')
makedepends=('cmake>=3.0')
install=skafos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MetisMachine/$pkgname/archive/$pkgver.tar.gz")
md5sums=('8afebbc2600b2e8d1647f3d3478068b8')
sha1sums=('8e72ec222203c489ce9d627a752425f34aef0156')
sha256sums=('b5a3e5735f87af11b6140ab0784a2be5339784cd4e2814ca26db878b7f2776b1')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make build_dist
}

package() {
	cd "$pkgname-$pkgver"
	install -D _build/bin/skafos $pkgdir/usr/bin/$pkgname
}
