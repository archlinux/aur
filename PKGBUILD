# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=hexchat-otr
pkgver=0.2.0
pkgrel=1
pkgdesc='HexChat plugin for Off-The-Record support'
arch=('i686' 'x86_64')
url='https://github.com/TingPing/hexchat-otr'
license=('GPL2')
conflicts=('hexchat-otr-git')
depends=('libotr' 'hexchat')
source=("https://github.com/TingPing/hexchat-otr/releases/download/$pkgver/hexchat-otr-$pkgver.tar.xz")
sha256sums=('3d0f4597612647c66a59c1e6e11d245b407dd94f09d3c9eb0f4eabe14bbf9b4b')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

