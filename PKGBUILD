# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=OpenFIRE-App
pkgname=openfireapp
pkgver=2.0
_rc='-rc5'
pkgrel=3
pkgdesc='Configuration utility for the OpenFIRE lightgun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/TeamOpenFIRE/OpenFIRE-App'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'icu')
makedepends=('cmake')
install=$pkgname.install
source=("https://github.com/TeamOpenFIRE/OpenFIRE-App/archive/refs/tags/v${pkgver}${_rc}.tar.gz"
        'org.TeamOpenFIRE.OpenFIREapp.desktop')
md5sums=('47c42640fdc565248819e44645418253'
         'd8b6cd0884c57ff3d5df1142ec9ca30b')

build() {
  mkdir "$srcdir/$_name-$pkgver${_rc}/build"
  cd "$srcdir/$_name-$pkgver${_rc}/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver${_rc}/build/OpenFIREapp" "$pkgdir/usr/bin/OpenFIREapp"
  install -Dm755 "$srcdir/$_name-$pkgver${_rc}/ico/openfire.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.TeamOpenFIRE.OpenFIREapp.svg"
  install -Dm755 "$srcdir/org.TeamOpenFIRE.OpenFIREapp.desktop" "$pkgdir/usr/share/applications/org.TeamOpenFIRE.OpenFIREapp.desktop"
}
