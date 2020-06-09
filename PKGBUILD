# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=unyaffs
pkgver=0.9.7
pkgrel=2
pkgdesc="A program to extract files from a yaffs image"
arch=("i686" "x86_64")
url="https://bernhard-ehlers.de/projects/unyaffs.html"
license=('GPL')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://git.bernhard-ehlers.de/ehlers/unyaffs/archive/${pkgver}.tar.gz")
sha256sums=('17489fb07051d228ede6ed35c9138e25f81085492804104a8f52c51a1bd6750d')

build() {
  cd "${srcdir}/${pkgname}"
  make unyaffs
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 unyaffs "${pkgdir}"/usr/bin/unyaffs
}
