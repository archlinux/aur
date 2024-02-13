# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat-bin
_pkgname=numbat
pkgver=1.10.1
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
sha256sums=(
  'b8889a1411a23aed32be5436413632fc55f312937475860107f44281dba961a4'
)


package() {
	cd "$_pkgname-v$pkgver-x86_64-unknown-linux-gnu"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  mkdir "$pkgdir/usr/share/$_pkgname"
	cp -r "modules" "$pkgdir/usr/share/$_pkgname/modules/"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

