# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=edfbrowser
pkgver=1.93
pkgrel=1
pkgdesc="A free, opensource, multiplatform, universal viewer and toolbox intended for, but
not limited to, timeseries storage files like EEG, EMG, ECG, BioImpedance, etc."
arch=('i686' 'x86_64')
url="http://www.teuniz.net/edfbrowser/"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://www.teuniz.net/edfbrowser/edfbrowser_${pkgver//.}_source.tar.gz
        edfbrowser.desktop)
noextract=()
sha1sums=('3d7bf1774d88185c7a3d79fb8ed700c293b0fdc0'
          '3076f5b8ab0313edb7b20ca13214382914725f52')

build() {
  cd "$srcdir/edfbrowser_${pkgver//.}_source"
  qmake
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"
  cp "$srcdir/edfbrowser_${pkgver//.}_source/edfbrowser" "$pkgdir/usr/bin"
  cp edfbrowser.desktop "$pkgdir/usr/share/applications"
  cp "$srcdir/edfbrowser_${pkgver//.}_source/images/edf.png" "$pkgdir/usr/share/icons/edfbrowser.png"
}
