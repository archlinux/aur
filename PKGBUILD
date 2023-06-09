# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Thulinma <jaron@vietors.com>
pkgname=qt6-jdenticon
_pkgname=qt-jdenticon
pkgdesc="Qt6 / C++14 Port of Jdenticon"
pkgver=0.3.0
pkgrel=1
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Nheko-Reborn/qt-jdenticon"
depends=('qt6-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nheko-Reborn/qt-jdenticon/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c4cbeba7848791b2386ac474ca7412b361ee949a126f10cdb523210a8415b436c365a3c056ca3fa9c196835f6bfc92b24a01f2906e62897b88af2e80a83d3bb3')

build() {
  cd "$_pkgname-$pkgver"
  qmake6
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

