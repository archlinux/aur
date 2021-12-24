# Maintainer: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=2.3.0-1
_tag="${_realver}"
pkgver=${_realver/-/.}
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-pid' 'adwaita-icon-theme')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/storaged-project/blivet-gui/archive/${_tag}.tar.gz")
sha512sums=('cf13480e076355e340198d83ea77b04338803e8fb1a5d2a942ae7754f28c5e6e48cbadef500ff053e2c3a0b795c8a0f4757c1da5e728f557ae7f551a0d6f5746')

build() {
  cd "${srcdir}/${pkgname}-${_tag}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_tag}"

  echo "${pkgdir}"
  make DESTDIR="${pkgdir}" RPM_BUILD_ROOT="${pkgdir}" install
}
