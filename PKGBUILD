# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=edfbrowser
pkgver=2.15
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
options=(!buildflags)
install=
changelog=
source=(https://www.teuniz.net/edfbrowser/edfbrowser_${pkgver//.}_source.tar.gz
        edfbrowser.desktop)
noextract=()
sha256sums=('164abb75c647eed1434882e19ee5e255475335caa8f86e1d8865f5b75767cc11'
            'e1e060d22cc545b125ec0dd7b8652f85449c45890e7c338d9c09eee7ce17bf34')

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
