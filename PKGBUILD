# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=1.0
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/GenTor"
license=('MIT')
depends=(python tor macchanger privoxy net-tools curl systemd dos2unix)
makedepends=()
source=("https://github.com/ChihebBayouli/gentor/releases/download/1.0/gentor-1.0.tar.gz")
install=gentor.install
md5sums=('d106e09f82affd51f7f9c4c3bdebd04e')
build() {
    cd "$srcdir/$pkgname"
    sudo python install.py build
}
package() {
    cd "$srcdir/$pkgname"
    sudo python install.py install
    sudo dos2unix /usr/bin/gentor
}
