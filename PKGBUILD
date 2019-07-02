# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=zfs-prune-snapshots
pkgver=1.0.1
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
sha512sums=('657b5c187b4097b03c99fd6d31c358ded1181cc580690356ea06f591d72ea0734ac863598c95d18d08bf2f433d6644853e289cf0dab6a0a7209c8aa89cc68063')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
