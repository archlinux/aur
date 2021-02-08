# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=pop-icon-theme
_basever=2.1.0
_timestamp=1610392112
_commit=ef2be60
# There are no releases on Github. So this package follows the official PPA's releases
# http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-icon-theme
pkgver="${_basever}~${_timestamp}~${_commit}"
pkgrel=1
pkgdesc="System76 Pop Icon Theme"
arch=('any')
url='https://github.com/pop-os/icon-theme'
license=('CCPL' 'GPL3')
depends=('gnome-icon-theme')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/icon-theme/archive/${_commit}.tar.gz")
sha512sums=('e8bfa301a4c0743eb3d0f52ed4066af9985a1783219ca815ff4a17fef888436f124e1d27d564094dce809343aed98a59e273f832093fd0f09164f7c6387531cc')

build() {
  cd "icon-theme-${_commit}"*
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "icon-theme-${_commit}"*
  DESTDIR="${pkgdir}" ninja -C build install
}

