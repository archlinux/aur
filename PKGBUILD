# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=OpenFIRE-App
pkgname=openfireapp
pkgver=2.2
_rc=''
pkgrel=1
pkgdesc='Configuration utility for the OpenFIRE lightgun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/TeamOpenFIRE/OpenFIRE-App'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'icu')
makedepends=('cmake')
install=$pkgname.install
source=("https://github.com/TeamOpenFIRE/OpenFIRE-App/archive/refs/tags/v${pkgver}${_rc}.tar.gz")
md5sums=('a98940df20aee352443b8616d5501a81')

build() {
  mkdir "$srcdir/$_name-$pkgver${_rc}/build"
  cd "$srcdir/$_name-$pkgver${_rc}/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver${_rc}/build/OpenFIREapp" "$pkgdir/usr/bin/OpenFIREapp"
  install -Dm755 "$srcdir/$_name-$pkgver${_rc}/ico/openfire.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.TeamOpenFIRE.OpenFIREapp.svg"
  install -Dm755 "$srcdir/$_name-$pkgver${_rc}/org.TeamOpenFIRE.OpenFIREapp.desktop" "$pkgdir/usr/share/applications/org.TeamOpenFIRE.OpenFIREapp.desktop"
}
