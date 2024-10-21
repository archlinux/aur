# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=debounce
pkgver=0.1.3
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
    '5460d464f78ccab08d4d743fb08550aa5ad5cc2210c46ce8f358669ed11e070f'
    '684d3e43c74a61b780ae70e72d2fbd79cde0407ffee5dd6adb98e50259c625d9'
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

