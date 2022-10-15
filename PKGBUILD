# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.4.1
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=(any)
url="https://www.laborejo.org/patroneo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=('new-session-manager: for session management')
options=(debug)
source=(https://www.laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('f3b9b17cddd467ff94d9aa592b3696b6e5dfc2c64e5243f8ce05e513d9454fd858ccabcf9e778a46e3cdf334c45455bdde258c3fa185a9be3774fd2f5937ef7f'
            'SKIP')
b2sums=('4f28bceb5c1bc1fb1cb64bccebaca4ea02240515c5022593e294529a9e986a7fd9337bced41afd2d738752e3998098ad4548080963f3e984adfd885c7abd19a0'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
}
