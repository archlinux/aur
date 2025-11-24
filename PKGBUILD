# Maintainer: Hicham Bouzkraoui <hichamm.bouzkraoui@gmail.com>
pkgname=tfplan
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal CLI tool to format Terraform plan output in a beautiful, human-readable format"
arch=('x86_64')
url="https://github.com/hichambouzkraoui/terraform-plan-formatter"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hichambouzkraoui/terraform-plan-formatter/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/terraform-plan-formatter-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/terraform-plan-formatter-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}