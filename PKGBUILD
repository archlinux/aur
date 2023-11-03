# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat-bin
_pkgname=numbat
pkgver=1.7.0
pkgrel=1
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('x86_64')
url="https://github.com/sharkdp/numbat"
license=('MIT' 'Apache-2.0')
depends=() 
makedepends=()
provides=('numbat')
conflicts=('numbat')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/sharkdp/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=(
  'be350c3a2fb306c87be860d1204a271809b02e16e80b3f115ca14f433f211f02d604c6fdcd8a84c434c3b9f7dc79213e1d97bd48c78de975286c03d8a1df5cac'
)


package() {
	cd "$_pkgname-v$pkgver-x86_64-unknown-linux-gnu"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  mkdir "$pkgdir/usr/share/$_pkgname"
	cp -r "modules" "$pkgdir/usr/share/$_pkgname/modules/"
	install -Dm644 "README.md" "$pkgdir/usr/doc/$_pkgname/README.md"
}

