# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=2.1.14-1
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
sha512sums=('76ff57894538fe6f04ce56d6ab0b2068050eadda3bb0940e0d8e76d796ad4a0143b5ebc48497ce9987dcb20a95c8379013744ca24bd6cc53aa12c8e8c9dce925')

build() {
  cd "${srcdir}/${pkgname}-${_tag}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_tag}"

  echo "${pkgdir}"
  make DESTDIR="${pkgdir}" RPM_BUILD_ROOT="${pkgdir}" install
}
