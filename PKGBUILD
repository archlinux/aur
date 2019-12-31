# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=zfs-prune-snapshots
pkgver=1.1.0
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
sha512sums=('bad4f3ba8aa383f6e9f80ab9280e8591a1b19f8d77e22fe0a54d5569030b43eb2e55cb5041a5735287d8ecfb997cfc218959a53cff4529f5221683a7210d0c63')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
