# Maintainer: Max Bruckner
pkgname=easyhg
pkgver=1.3.0
pkgrel=3
pkgdesc="Simple user interface for the Mercurial distributed version contol system."
arch=('i686' 'x86_64')
url="http://easyhg.org"
license=('GPL2')
depends=('qt4' 'mercurial')
optdepends=('pyqt: authentication extension'
'python-crypto: password store'
'kdiff3: external diff/merge tool')
source=("https://code.soundsoftware.ac.uk/attachments/download/639/EasyMercurial-$pkgver-src.tar.gz"
    easyhg.desktop
)
sha512sums=('abb1eff1b5e0427006d6bdbf6d9d2b8ffde4b5095d8606b12b49c4aa2d4203a4eec230c2cdda7211077d14bd128374a7a116b51c2699fc6f05c456108f4772ae'
            'a26479bbb83f85874f057889a42d6aea1f4998b1f79c2b817bcc8ab10cbe6d93e1798f05b3724c85a3b2c60793d33d62df8db2af5c6010c38e1b8a6314528f2e')

build() {
  cd "$srcdir/EasyMercurial-$pkgver-src"
  qmake-qt4
  make
}

package() {
  install -Dm 755 "$srcdir/EasyMercurial-$pkgver-src/EasyMercurial" "$pkgdir/usr/bin/easyhg"
  install -Dm 644 "$srcdir/EasyMercurial-$pkgver-src/images/icon/scalable/easyhg-icon.svg" "$pkgdir/usr/share/pixmaps/easyhg.svg"
  install -Dm 644 "$srcdir/easyhg.desktop" "$pkgdir/usr/share/applications/easyhg.desktop"
}
