# Maintainer: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: jkoch < 	johannes [aTTTT] ortsraum {d00t} de>
# Contributor: Daniel Dietrich <shaddow2k@@gmail..com>
pkgname=kleiner-brauhelfer
pkgver=2.1.1
pkgrel=1
pkgdesc="A Qt-based tool for hobby brewer to calculate and manage the beer brewing process."
arch=("i686" "x86_64")
url="https://github.com/kleiner-brauhelfer/kleiner-brauhelfer-2"
license=('GPL3')
depends=('qt5-webengine' 'qt5-charts' 'qt5-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kleiner-brauhelfer/$pkgname-2/archive/v$pkgver.tar.gz"
        kleiner-brauhelfer.desktop)

build() {
  cd "$pkgname-2-$pkgver"

  qmake-qt5 kleiner-brauhelfer-2.pro
  make
}

package() {
  cd "$pkgname-2-$pkgver"
  
  install -d "$pkgdir/usr/bin"
  install -m755 -D "bin/kleiner-brauhelfer-2" "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/pixmaps"
  install -m644 -D "deployment/kleiner-brauhelfer-2.svg" "$pkgdir/usr/share/pixmaps"

  install -d "$pkgdir/usr/share/applications"
  install -m644 -D "$srcdir/kleiner-brauhelfer.desktop" "$pkgdir/usr/share/applications"
}

sha256sums=('8f18407e969c792a0eed0dc68318e21835824a5960c812f339f1f1fe87f8da7e'
            '688d4ca1c70d19bbfdcd2b1f546f52e7ef585d5ed0b3566a4fb5f0c29317a11a')
