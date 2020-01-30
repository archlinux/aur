# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=2.1.12-1
_tag="${_realver}"
pkgver=${_realver/-/.}
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-pid' 'adwaita-icon-theme')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/rhinstaller/blivet-gui/archive/${_tag}.tar.gz")
sha512sums=('230934f3ee30a7097b0924376be8cfbfae3e532744785bc9c1c9020b0326b08c08d8d4eddee37954ec4f1e436971facebfcceade106dafae19f256c125b0bdb0')

build() {
  cd "${srcdir}/${pkgname}-${_tag}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_tag}"

  make DESTDIR="${pkgdir}" install
}
