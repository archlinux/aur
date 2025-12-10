# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=meow
pkgname=$_projectname-nvim
pkgver=2.0.0
pkgrel=1
pkgdesc="cat alternative using Neovim for highlighting and configuration"
arch=("x86_64")
url="https://github.com/datsfilipe/$_projectname"
license=("MIT")
depends=("neovim")
makedepends=("rust")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e3284fe4ae1aa4891acabbc954410a6c7291c513ab7b7b4c567f8cc142f2f1848d21ca42f683f4780cac30b2d6decb69951a9d9f510c0d22404ea50b839aa3d8')

build() {
    cd "$_projectname-$pkgver"
    cargo build --release
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 target/release/meow "$pkgdir/usr/bin/meow"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
