# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=3.2
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(go gzip make)
provides=(sof sof.1.gz)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("10df34ba982a735200c9fbcd338b1868d21199a6ebdd62a2df3afd3bcea923e7")

package() {
		make -C ./sof
		DESTDIR="$pkgdir" make -C ./sof PREFIX="/usr" install install-man
}
