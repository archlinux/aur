# Maintainer: Ivan Shapovalov <intelfx.name>

_srcname=intel-ipsec-mb
pkgname=libipsec-mb
pkgver=0.54
pkgrel=2
epoch=
pkgdesc="Intel(R) Multi-Buffer Crypto for IPsec Library"
arch=(x86_64)
url="https://github.com/intel/intel-ipsec-mb"
license=('BSD')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_srcname-$pkgver.tar.gz::https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
sha256sums=('8c6d59d68ee567a3c9db0967e3ca18cb61cddd73d07feed8a9b232106607228d')

build() {
	cd "$_srcname-$pkgver"
	make
}

#
# Doesn't build
#
#check() {
#	cd "$_srcname-$pkgver"
#	make -C LibTestApp
#}

package() {
	cd "$_srcname-$pkgver"
	make install \
		PREFIX="$pkgdir/usr" \
		MAN_DIR="$pkgdir/usr/share/man/man7" \
		NOLDCONFIG=y
	install -Dm644 LICENSE \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
