# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.49.6
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64')
url="https://github.com/yoheimuta/protolint"
license=('MIT')
depends=()
makedepends=()
source=(
	"$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz"
	"upstream_source.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('215c583be4fe17ffbd1e50fb75f3a26ce0fa5a5d065b0b57ba6fd068f4a41be8'
            'a6fe1b9ac53a0081c2483876cbd461c3a48639b5c8db40ad3a3ab38692041c77')

package() {
	cd $srcdir
	install -Dm 0755 protolint $pkgdir/usr/bin/protolint
	install -Dm 0755 protoc-gen-protolint $pkgdir/usr/bin/protoc-gen-protolint
	install -Dm 0644 $pkgname-$pkgver/README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
