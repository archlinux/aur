# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=batctl
pkgver=2016.0
pkgrel=1
pkgdesc='B.A.T.M.A.N. advanced control and management tool'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
depends=('libnl')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}

sha256sums=('1ea0bc6a6541f72bccfc6a18656abac468c80c0213de614460d7482338e0174e')
