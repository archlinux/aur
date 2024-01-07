# Maintainer: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: jkoch < 	johannes [aTTTT] ortsraum {d00t} de>
# Contributor: Daniel Dietrich <shaddow2k@@gmail..com>
pkgname=kleiner-brauhelfer
pkgver=2.6.2
pkgrel=1
pkgdesc="A Qt-based tool for hobby brewer to calculate and manage the beer brewing process."
arch=("i686" "x86_64")
url="https://github.com/kleiner-brauhelfer/kleiner-brauhelfer-2"
license=('GPL3')
depends=('qt6-webengine' 'qt6-charts' 'qt6-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kleiner-brauhelfer/$pkgname-2/archive/refs/tags/v$pkgver.tar.gz"
        kleiner-brauhelfer.desktop)

build() {
  cd "$pkgname-2-$pkgver"

  qmake6 kleiner-brauhelfer-2.pro
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

sha256sums=('639471ee5c4dd60c1cc5726a1f5d5ea724cded3a544a704668bb2ca92cabcb00'
            '186b19866751e3a2bf89e5e3f1e614eff01db2db8afa4c9e52c0d02e5c608cbd')
