# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sizeof-go
pkgver=2.0
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sizeof"
arch=(x86_64)
depends=()
makedepends=(go)
provides=(sizeof)
conflicts=(sizeof sizeof-pypy)
source=("https://codeberg.org/balaraz/sizeof/archive/v${pkgver}.tar.gz")
sha256sums=("f5437bc982790f43203623b1342a18d771e16642ad20f5770cdefead74fda8ab")

package() {
		cd $srcdir/sizeof
		go build --ldflags="-s -w" sizeof.go
		install -Dm775 sizeof -t ${pkgdir}/usr/bin/
}
