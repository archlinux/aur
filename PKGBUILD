# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=debounce
pkgver=0.1.2
pkgrel=1
pkgdesc='A utility for debouncing lines from stdin'
url='https://codeberg.org/coralpink/debounce'
arch=('any')
license=('custom:MIT+NIGGER')
source=(
    "$pkgname.tar.gz::https://codeberg.org/coralpink/debounce/archive/$pkgver.tar.gz"
    "$pkgname.tar.gz.sig::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgver.tar.gz.sig"
)
sha256sums=(
    'bb7379ca6d8ef8b6e98c7bf19d24dd8b9e9849f4fa0873b61fea7d7ea8cb0e73'
    '17fa189918794f8618065d410c8e36654e5cdd4befb553f7b09771744d55d28d'
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname"
    CC=cc make
}

package() {
    cd "$srcdir/$pkgname"
    CC=cc make DESTDIR="$pkgdir" PREFIX=/usr PACKAGE_NAME="$pkgname" install
}

