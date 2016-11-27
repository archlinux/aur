# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=hexchat-otr
pkgver=0.2.1
pkgrel=1
pkgdesc='HexChat plugin for Off-The-Record support'
arch=('i686' 'x86_64')
url='https://github.com/TingPing/hexchat-otr'
license=('GPL2')
conflicts=('hexchat-otr-git')
depends=('libotr' 'hexchat')
source=("https://github.com/TingPing/hexchat-otr/releases/download/$pkgver/hexchat-otr-$pkgver.tar.xz")
sha256sums=('741ef50e40439ca35ccd0537794a1d4e4ef9878d318cbb773a90e6578d357521')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

