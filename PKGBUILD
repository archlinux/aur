# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.49.8
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
sha256sums=('035f3fd1d6c50f223604ec4f99b5f9bbd9d4d9dae77a050a521fa651b287822e'
            'fa84c2161936d6dd001b452cf6c59c8090c92fc022fca664c25b959ee33fb25a')

package() {
	cd $srcdir
	install -Dm 0755 protolint "$pkgdir/usr/bin/protolint"
	install -Dm 0755 protoc-gen-protolint "$pkgdir/usr/bin/protoc-gen-protolint"
	install -Dm 0644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
