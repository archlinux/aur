# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=batctl
pkgver=2015.0
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

sha256sums=('634d91189f96bda6d4ce6179dce90ad578566f29d3111b49d6e775d4f3591f04')
