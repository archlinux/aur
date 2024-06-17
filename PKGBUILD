# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=OpenFIRE-App
pkgname=openfireapp
pkgver=2.0
pkgrel=1
pkgdesc='Configuration utility for the OpenFIRE lightgun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/TeamOpenFIRE/OpenFIRE-App'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'icu')
makedepends=('cmake')
install=$pkgname.install
source=("https://github.com/TeamOpenFIRE/OpenFIRE-App/archive/refs/tags/v${pkgver}-rc3.tar.gz"
        'org.TeamOpenFIRE.OpenFIREapp.desktop')
md5sums=('1172c73a05f6e6ed3dc7a21f04ac396a'
         'd8b6cd0884c57ff3d5df1142ec9ca30b')

build() {
  mkdir "$srcdir/$_name-$pkgver-rc3/build"
  cd "$srcdir/$_name-$pkgver-rc3/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver-rc3/build/OpenFIREapp" "$pkgdir/usr/bin/OpenFIREapp"
  install -Dm755 "$srcdir/$_name-$pkgver-rc3/ico/openfire.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.TeamOpenFIRE.OpenFIREapp.svg"
  install -Dm755 "$srcdir/org.TeamOpenFIRE.OpenFIREapp.desktop" "$pkgdir/usr/share/applications/org.TeamOpenFIRE.OpenFIREapp.desktop"
}
