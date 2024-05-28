# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.49.7
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
sha256sums=('d1646a1ca1e732f31b5a0981378deef5523eb0b718ec81dc0a1ac41252cde6de'
            '75e707b8b690264f740e6b6959bb80032d782ce1fdc20e1dc058c6c1c4503e11')

package() {
	cd $srcdir
	install -Dm 0755 protolint "$pkgdir/usr/bin/protolint"
	install -Dm 0755 protoc-gen-protolint "$pkgdir/usr/bin/protoc-gen-protolint"
	install -Dm 0644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
