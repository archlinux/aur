# Maintainer: Abdur Rehman Imran <arehmanimran4@gmail.com>
pkgname=uconv
pkgver=1.0.2
pkgrel=1
pkgdesc="A CLI Unit Converter written in Rust."
arch=('any')
url="https://github.com/abdurehman4/uconv"
license=('GPL')
makedepends=('rust' 'cargo')
provides=('uconv')
conflicts=('uconv')
source=(git+"https://github.com/abdurehman4/uconv")
md5sums=('SKIP')

build() {
	cd "$pkgname"
    make
}


package() {
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin/"
	cp  "$pkgname/target/release/uconv" "$pkgdir/usr/bin/"
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
