# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=pop-icon-theme
_basever=2.1.0
_timestamp=1626456130
_commit=8e5d8ca
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
source=("${pkgname}-${_commit}.tar.gz::https://github.com/pop-os/icon-theme/archive/${_commit}.tar.gz")
sha512sums=('3676e0f3ddf138991125750109431fb309b9c0f3e8a7530905a74a90d29e8a8f454cd683da1e3ac0b610a8b60625a82ae63220dac61cec0449721f4d48575129')

build() {
  cd "icon-theme-${_commit}"*
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "icon-theme-${_commit}"*
  DESTDIR="${pkgdir}" ninja -C build install
}

