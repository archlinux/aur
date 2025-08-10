# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=unshell
pkgver=0.12.2
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
    'a6ed765e5ab7b6a8fdea784b479ea229fdddca975a3bd5e14e5211fdc7adccdb6112a993316839003a8153bc5b0914feb32b9cb1f3e84060897554ae04050f0f'
    '65b952f1d047204240e3f732bf4a08d129f8830aa17037da5d36b218a49537e202dbdc2ae5a3b8de6a3fb323ee2fc55c3d4c85bbefa3f9ee79fde84525c6918c' 
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
