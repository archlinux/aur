# Maintainer : maoxuner <maoxuner at 126 dot com>
# Maintainer : Sébastien Deligny <sebdeligny at gmail>

pkgname=thunar-shares-plugin
pkgver=0.3.2
pkgrel=1
epoch=1
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/${pkgname}"
license=('GPL2' 'LGPL')
depends=('thunar>=1.7.0' 'samba')
makedepends=('xfce4-dev-tools')
install="${pkgname}.install"
source=(
  "https://archive.xfce.org/src/thunar-plugins/${pkgname}/0.3/${pkgname}-${pkgver}.tar.bz2"
)
sha1sums=(
  "fb41eae712bdf91ba52b7d10f6513444dd88569e"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=$(pkg-config --variable prefix thunarx-3)
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
