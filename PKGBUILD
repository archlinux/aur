# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mspaint-xp-bin
pkgver=v1
depends=('wine')
pkgrel=1
arch=(x86_64)
pkgdesc="The classic MS PAINT of Windows XP"
license=("proprietary")
options=(!strip)
url="https://archive.org/details/MSPaintWinXP"
source=("https://archive.org/download/MSPaintWinXP/mspaint%20WinXP%20English.zip" 'http://support.casahl.com/kb/raknowledgebase.nsf/743c29533b14ab63882564ae007d738a/07d8d84ab1a2c09d8825686c007ab6d1/$FILE/mfc42.dll')

sha256sums=("438c7d5543d952f9ffe26040e552c332b83e213b775eaedbbb3ddbe1eb545612" "aa8c615c8bbcd8ad4a9b624addb512e0702223eb5f266ce8f6a9a005f718a483")

package() {
    _DESTINATION="$pkgdir/usr/share/mspaint-xp"
    mkdir -p $_DESTINATION
    cp "$srcdir/mfc42.dll" $_DESTINATION
    cp "$srcdir/WinXP English/mspaint.exe" $_DESTINATION
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/../mspaint" "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/mspaint"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/../mspaint.desktop" "$pkgdir/usr/share/applications"
}
