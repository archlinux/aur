# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=unshell
pkgver=0.12.0
pkgrel=1
pkgdesc='A utility for splitting input into shell-like tokens'
url='https://codeberg.org/coralpink/unshell'
arch=('x86_64' 'aarch64')
license=('LicenseRef-MIT+NIGGER')
depends=('glibc')
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/coralpink/unshell/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://codeberg.org/coralpink/unshell/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
b2sums=(
    'aa31b2613dd760214c92d0186fd533f0ed0d094211a6753d083e91e0ff34050fe3c3283bcad87cc291e8d4b8d859e9e82781a16c7a4128d8d2cd504f1c873372'
    '526d44950d69e6f3ff01c58e25566048037e5eb610ba81e4568589dec250b34f5666125313d6326a4e8c3068c67522d3e4562473f8d15b233f0656539c98eea8' 
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}
