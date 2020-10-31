# Maintainer: Björn Wiedenmann <archlinux at xorxor dot de>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok at gmail dot com>
# Contributor: keith <keith at hubbard dot net>

pkgname=mp3gain
pkgver=1.6.2
pkgrel=2
pkgdesc='Lossless mp3 normalizer with statistical analysis'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://sourceforge.net/projects/mp3gain/'
license=('GPL')
depends=('mpg123')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver//./_}-src.zip")
md5sums=('013551d985f517d9f0d767ee51366f1b')

build() {
    cd "$srcdir"
    make OSTYPE=linux
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir"/usr/bin
    make OSTYPE=linux INSTALL_PATH="$pkgdir"/usr/bin install
}
