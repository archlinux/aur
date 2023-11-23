# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sizeof-go
pkgver=1.0
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
arch=(any)
depends=()
makedepends=(go)
provides=(sizeof)
conflicts=(sizeof sizeof-pypy)
source=("https://codeberg.org/balaraz/sizeof/archive/v1.0.tar.gz")
sha256sums=("4dae89ded56b37bc8aeeac52c34e7f70469e12bd70d651b9511a65886856bfc8")

package() {
		cd $srcdir/sizeof
		go build --ldflags="-s -w" sizeof.go
		install -Dm775 sizeof -t ${pkgdir}/usr/bin/
}
