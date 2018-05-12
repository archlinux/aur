# Maintainer: Björn Wiedenmann <archlinux at xorxor dot de>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok at gmail dot com>
# Contributor: keith <keith at hubbard dot net>

pkgname=mp3gain
pkgver=1.6.1
pkgrel=1
pkgdesc='Lossless mp3 normalizer with statistical analysis'
arch=('x86_64' 'armv7h')
url='https://sourceforge.net/projects/mp3gain/'
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver//./_}-src.zip")
md5sums=('0df5c6849353de212e8c36a0353d716c')

build() {
    cd "$srcdir"
    make OSTYPE=linux
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir"/usr/bin
    make OSTYPE=linux INSTALL_PATH="$pkgdir"/usr/bin install
}
