# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=plasma6-wallpapers-application
_pkgname=plasma-wallpaper-application
pkgver=1.0
pkgdesc="Set an arbitrary application as your Plasma 6 background"
pkgrel=1
arch=('any')
url="https://invent.kde.org/dos/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cmake')
depends=('plasma-workspace')
source=("${_pkgname}-${pkgver}.tar.gz::https://invent.kde.org/dos/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('ef6a8acaf9557327789be85eecfd282e15d792fc5e42989b5a70bcfac5a3e79a')

build(){
  cd ${srcdir}/${_pkgname}-v${pkgver}
  cmake -B build -S .
}

package(){
  cd ${srcdir}/${_pkgname}-v${pkgver}
  DESTDIR="$pkgdir" cmake --install build
}
