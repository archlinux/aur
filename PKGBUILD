# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=status-notifier
pkgname=dfl-status-notifier
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="Implementation of the XDG Status Notification Specifications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('4e0a5cd05be89c3d2bc8bf27689080ea')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
