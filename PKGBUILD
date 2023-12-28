# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=smsync
pkgver=3.5.2
pkgrel=1
pkgdesc="smsync (Smart Music Sync) keeps huge music collections in sync and is takes care of conversions between different file formats. It's an easy-to-use command line application for Linux"
arch=(
  aarch64  
  x86_64
)
url="https://$_pkgorg/$pkgname/"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('b47f6e387c3ec49187e8a06af31ccd1fd417b28e0dbd8da4cbf1630d52507826')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
depends=(ffmpeg)
makedepends=(
  bash
  git
  go
  make
)
conflicts=(smsync-git)

build() {
  cd "${pkgname}-v${pkgver}" || return
  make
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
