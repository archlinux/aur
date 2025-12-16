# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=meow
pkgname=$_projectname-nvim
pkgver=2.1.1
pkgrel=1
pkgdesc="cat alternative using Neovim for highlighting and configuration"
arch=("x86_64")
url="https://github.com/datsfilipe/$_projectname"
license=("MIT")
depends=("neovim")
makedepends=("rust")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('145dea745f45ff42ac62198f4eab9a94ae90375744deccb9442b95d299020ba688f8d12574a4a2d9f421612538bad485d1c70990320a614f450cd01cffc42216')

build() {
    cd "$_projectname-$pkgver"
    cargo build --release
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 target/release/meow "$pkgdir/usr/bin/meow"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
