# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: gspu <bssbk2455[at]gmail[dot]com>

pkgname=bitkeeper
pkgver=7.3.3
pkgrel=1
pkgdesc="a fast, enterprise-ready, distributed SCM"
arch=(i686 x86_64)
url="http://www.bitkeeper.org"
license=(Apache)
depends=(libxft libtomcrypt)
makedepends=(gperf)
_commit=5695c0d0ecd062f13542c3cb04dd872466774fbf
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/bitkeeper-scm/bitkeeper/archive/${_commit}.tar.gz")
sha256sums=('297f54b41222c27e4990dce1e51b4fb45971fb8ff88973a52c3808f5b5b2464c')

build () {
  cd "${srcdir}/${pkgname}-${_commit}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  make DESTDIR="${pkgdir}" install
}

