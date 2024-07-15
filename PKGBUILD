# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=zfs-prune-snapshots
pkgver=1.5.0
pkgrel=1
pkgdesc='Remove snapshots from one or more zpools that match given criteria.'
arch=(any)
url='https://github.com/bahamas10/zfs-prune-snapshots'
license=(MIT)
makedepends=(make)
checkdepends=(shellcheck)
depends=(bash)
conflicts=(${pkgname}-git)
source=("https://github.com/bahamas10/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d7e3aa832cb5f91735bb57cd2af07a7d32433a829f9e090846b96cfffe565bdc8625c17bb72719f42d9f807ec1a3692a144578c4fc801928680a55ae5bba7b26')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
