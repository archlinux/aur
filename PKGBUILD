# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>

pkgname=qoauth
pkgver=2.0.0
pkgrel=3
pkgdesc="Support with OAuth-powered network services"
url='https://github.com/ayoy/qoauth'
license=(GPL)
arch=(x86_64)
depends=(qca-qt5)
source=($pkgname-$pkgver::"https://github.com/ayoy/qoauth/archive/v$pkgver.tar.gz")
sha256sums=('a28005986410d333e03d077679cdf6c504ec5a33342867dc0f9fb0b74285e333')

prepare() {
  cd $pkgname-$pkgver

  # Install libraries in /usr/lib/
  sed -i 's|lib64|lib|' src/src.pro
}

build() {
  cd $pkgname-$pkgver
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
