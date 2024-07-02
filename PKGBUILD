# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.50.2
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64')
url="https://github.com/yoheimuta/protolint"
license=('MIT')
depends=()
makedepends=()
source=(
	"$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz"
	"$pkgname-${pkgver}_repo.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('b48a9d3d453d74f394ab2070c6361af16ab4ec9cb9d54742fb4334d03b92075c'
            '8314e7d295ff2f9f0e537d932c0036fb5e3352f14e09fa9c54dea52eded3fd7d')

package() {
	cd $srcdir
	install -Dm 0755 protolint "$pkgdir/usr/bin/protolint"
	install -Dm 0755 protoc-gen-protolint "$pkgdir/usr/bin/protoc-gen-protolint"
	install -Dm 0644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
