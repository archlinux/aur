# Maintainder: samedamci <samedamci@disroot.org>
pkgname=rofi-todo
pkgver=1.1
pkgrel=1
pkgdesc="Script to manage JSON-style notes in rofi"
arch=('any')
url="https://github.com/samedamci/${pkgname}"
license=('MIT')
depends=('python3')
makedepends=('python-pip')
source=("https://github.com/samedamci/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b00fac72f4fb5dc7460442963f5533f331d3270f4c48a3c2cd6ae56bbbc03267545377f6a78d295f22e6eebb6f72fe959505ce51d45b5f99f8468150992358bd')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"
	
	pip3 install --user -r requirements

	install -Dm755 "rofi-todo.py" "$pkgdir/usr/bin/${pkgname}"

	install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
