# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.20
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('i686' 'x86_64')
url="https://bitbucket.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<5.1' 'python>=3.2' 'python<3.6' 'python-pyqt5')
install="$pkgname.install"
source=("$url/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('4af84dba3b71a91b1e4918b100bec755')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
