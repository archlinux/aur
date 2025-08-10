# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=debounce
pkgver=0.2.0
pkgrel=1
pkgdesc='A utility for debouncing lines from stdin'
url='https://codeberg.org/coralpink/debounce'
arch=('x86_64' 'aarch64')
license=('LicenseRef-MIT+NIGGER')
depends=('glibc')
source=(
    "$pkgname.tar.gz::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname.tar.gz.sig::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
b2sums=(
    '7237b6684e6148bc6739cdcdd67531f71c36ea60ba7bff9fc43cd0aa075686399e320e911cedd6d0280fb8b56bf5970802b0cee98ad4fb3870e71ae802cc8df3'
    'd957103e60a9534ee54ffc9d88e977f01a51ac9d4582e7e09c26ba1d85ddf4a5d6d54e11040a5e74f944f79c3df0e6801280f1826a7f29e89b623918d7f33eb8'
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

