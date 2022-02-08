# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=mysql2sqlite-git
pkgver=r54.d14d22a
pkgrel=2
pkgdesc="Converts MySQL dump to SQLite3 compatible dump"
arch=("any")
url="https://github.com/dumblob/mysql2sqlite"
license=("MIT")
depends=("awk")
makedepends=("git")
provides=("mysql2sqlite")
source=('git+https://github.com/dumblob/mysql2sqlite.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/mysql2sqlite"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mysql2sqlite"
  install -Dm755 mysql2sqlite "${pkgdir}/usr/bin/mysql2sqlite"
}
