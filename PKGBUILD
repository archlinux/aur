# Maintainer: Max Bruckner
pkgname=easyhg
pkgver=1.4
pkgrel=2
pkgdesc="Simple user interface for the Mercurial distributed version contol system."
arch=('i686' 'x86_64')
url="http://easyhg.org"
license=('GPL2')
depends=('qt5-base' 'mercurial')
optdepends=('pyqt: authentication extension' 'kdiff3: external diff/merge tool')
source=("https://code.soundsoftware.ac.uk/attachments/download/2433/EasyMercurial-$pkgver-src.tar.gz"
    easyhg.desktop
)
sha512sums=('0e5a2e53d6b5dad1e0a5ace53c1fad5c99cf669a12112dfa9ccdfd58ee6c26c6e0eb40cc5065032dc2086756786e9eba09f9af69380346cf8256da559821a615'
            'a26479bbb83f85874f057889a42d6aea1f4998b1f79c2b817bcc8ab10cbe6d93e1798f05b3724c85a3b2c60793d33d62df8db2af5c6010c38e1b8a6314528f2e')

build() {
  cd "$srcdir/EasyMercurial-$pkgver-src"
  qmake
  make
}

package() {
  install -Dm 755 "$srcdir/EasyMercurial-$pkgver-src/EasyMercurial" "$pkgdir/usr/bin/easyhg"
  install -Dm 644 "$srcdir/EasyMercurial-$pkgver-src/images/icon/scalable/easyhg-icon.svg" "$pkgdir/usr/share/pixmaps/easyhg.svg"
  install -Dm 644 "$srcdir/easyhg.desktop" "$pkgdir/usr/share/applications/easyhg.desktop"
}
