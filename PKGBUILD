# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Pull requests are welcome here: https://github.com/yurikoles-aur/obs-service-source_validator
#

_servicename=source_validator
pkgname=obs-service-"${_servicename}"
pkgname=obs-service-source_validator
pkgver=0.41
pkgrel=1
pkgdesc='An OBS source service: running all the osc source-validator checks'
arch=('any')
url="https://github.com/openSUSE/obs-service-source_validator"
license=('GPL-2.0-or-later')
depends=(
  bzip2
  cpio
  diffutils
  gnupg
  libxml2
  obs-build
  patch
  perl-timedate
  unzip
  xz
  zstd
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('de6b68f336b51d47c2e2a94e7c8d01f93b0126f2c1dc3998531e29b5f3bed23c')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver"
  make VERBOSE=1 test
}
