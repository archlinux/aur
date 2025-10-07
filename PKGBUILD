# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=plasma6-wallpapers-application
_pkgname=plasma-wallpaper-application
pkgver=1.1
pkgdesc="Set an arbitrary application as your Plasma 6 background"
pkgrel=2
arch=('any')
url="https://invent.kde.org/dos/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cmake' 'extra-cmake-modules')
depends=('plasma-workspace')
optdepends=('xwayland-run: for launching X11 applications')
source=("${_pkgname}-${pkgver}.tar.gz::https://invent.kde.org/dos/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('6741014691d8e4d7222d06683fb7e2ffdbafd8690f1f693fe09928125e3222ca')

build(){
  cd ${srcdir}/${_pkgname}-v${pkgver}
  cmake -B build -S .
}

package(){
  cd ${srcdir}/${_pkgname}-v${pkgver}
  DESTDIR="$pkgdir" cmake --install build
}
