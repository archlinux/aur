# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=2.1.11-1
_tag="${_realver}"
pkgver=${_realver/-/.}
pkgrel=2
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-pid' 'adwaita-icon-theme')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/rhinstaller/blivet-gui/archive/${_tag}.tar.gz")
sha512sums=('7e9944a2385ac5ff72e75162138ba9a8b927b45e4b37369d5b47e4aa7103fe8c8e645d1d8696ed4860022f9c80c05ab4c870b3f0fba2d23cea98a89f94f54754')

build() {
  cd "${srcdir}/${pkgname}-${_tag}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_tag}"

  make DESTDIR="${pkgdir}" install
}
