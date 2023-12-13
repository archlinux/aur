# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=3.1
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(go gzip make)
provides=(sof sof.1.gz)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("7acc70d461d13b3c19ad2c066e2a0117831e309d55da893f8b7fcb79b42d63ae")

package() {
		make -C ./sof
		DESTDIR="$pkgdir" make -C ./sof PREFIX="/usr" install install-man
}
