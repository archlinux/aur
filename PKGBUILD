# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=redis-create-cluster
pkgver=6.2.1
pkgrel=1
epoch=
pkgdesc="A small script used to easily start a big number of Redis instances configured to run in cluster mode"
arch=(any)
url="https://github.com/redis/redis/tree/unstable/utils/create-cluster"
license=('BSD')
groups=()
depends=('redis')
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
source=("https://raw.githubusercontent.com/redis/redis/$pkgver/utils/create-cluster/create-cluster")
noextract=()
md5sums=('964d32a46891357ed755b402fdb9f602')
validpgpkeys=()

prepare() {
	sed -i 's/BIN_PATH="..\/..\/src\/"/BIN_PATH="\/usr\/bin"/' create-cluster
}

package() {
	mkdir -pv $pkgdir/usr/bin/
	install -Dm755 create-cluster $pkgdir/usr/bin/
}
