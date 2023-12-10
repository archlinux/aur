# Maintainer: Rohit Lodha <rohitlodha+aur@gmail.com>

pkgname=mudpack
pkgver=0.9.2
pkgrel=1
pkgdesc="Build and maintain multiple arch repo"
url=https://github.com/bogusfocused/mudpack
arch=('x86_64')
license=('MIT')
depends=('base-devel' 'pacutils')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/bogusfocused/mudpack/archive/refs/tags/v${pkgver}.tar.gz"
	"mudpack-sysusers.conf"
)

build() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/mudpack-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/mudpack.conf"
}

sha256sums=('2ab62532c1e8d62f79626ff3ca8fc11f7b1ebf403f4f0f0c3421f0fc2181118a'
            '5b1ccb2ac8ccae494088601d32bb663d6dd8cd55c926442b9c11d920462034e2')
