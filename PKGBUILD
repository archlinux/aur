# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-active-window-control
_pkgname=plasma-applet-active-window-control
pkgver=1.7.0
pkgrel=1
pkgdesc='Plasma 5 applet for controlling currently active window'
url="https://github.com/kotelnik/${_pkgname}"
arch=(i686 x86_64)
license=(GPL2)
depends=(plasma-workspace qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
conflicts=("${_pkgname-*}" plasma-applet-active-window-control-git plasma5-applets-active-window-control-git)
source=("https://github.com/kotelnik/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d31317c6a3a7a4c89b46271194ba3d6abdaf93f8c0627da27f0a0223d8b12b74')

build() {
  cd "${_pkgname}-${pkgver}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${_pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
