# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=unyaffs
pkgver=0.9.7
pkgrel=3
pkgdesc="A program to extract files from a yaffs image"
arch=("i686" "x86_64")
url="https://web.archive.org/web/20200807212923/https://www.b-ehlers.de/projects/unyaffs.html"
license=('GPL')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://deb.debian.org/debian/pool/main/u/unyaffs/unyaffs_${pkgver}.orig.tar.gz")
sha256sums=('099ee9e51046b83fe8555d7a6284f6fe4fbae96be91404f770443d8129bd8775')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make unyaffs
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 unyaffs "${pkgdir}"/usr/bin/unyaffs
}
