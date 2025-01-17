# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=debounce
pkgver=0.1.4
pkgrel=1
pkgdesc='A utility for debouncing lines from stdin'
url='https://codeberg.org/coralpink/debounce'
arch=('any')
license=('custom:MIT+NIGGER')
source=(
    "$pkgname.tar.gz::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname.tar.gz.sig::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
b2sums=(
    'a2f3dd6215283523b2946ff78e96f69785cc299fbb5ca6f3fe630396c558890e1a095d29f2781af8ce967288e5c043fbce720295431a71312c1c35bb869644c3'
    'aec595ec0259ea9b96d380beab07250cef60a5f915a9600c91faf8655627d3547d01cbb09af834a42dbefd62442474200f9af5a3680c7a79fb64c474c6830fd7'
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

