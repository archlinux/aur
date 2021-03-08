# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
pkgver=1.4.4
pkgrel=1
pkgdesc="A simple Qt5 frontend to MPD"
arch=('x86_64')
url="https://sourceforge.net/projects/quimup/"
license=('GPL2')
makedepends=()
depends=('mpd' 'qt5-base' 'taglib')
source=("quimup_${pkgver}_source.tar.gz::https://sourceforge.net/projects/quimup/files/Quimup_${pkgver}_source.tar.gz")
sha512sums=('fb3727bf5c0f756c888484f7c061da95a1ece15673079ac8e6ffc82289f78cfce3dda7245ae25b1d705ffe057f1b0930baf2338bdfe0f16c900dc1ffd3fef807')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build() {
  cd build
  qmake-qt5 PREFIX=/usr -Wnone "../Quimup_${pkgver}_source"
  make
}

package() {
  # there is no install target
  install -Dm755 "${srcdir}/build/quimup" "${pkgdir}/usr/bin/quimup"
}

sha512sums=('4fac921df6e7157952536e1cdda0e468b72f70f8f938ccfd5d1a7d286f4b7d7ac063ca2c6111f38fb76b2a6235a323858f2f898165c80702b2c0aaeaff8869c9')
