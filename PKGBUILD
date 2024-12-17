pkgname=rustybrain
pkgver=0.4.3
pkgrel=1
pkgdesc="A CLI based Task Management App for Archlinux"  
arch=('x86_64')
url="https://github.com/sricharanandra/rustybrain"  
license=('Apache')  
depends=('rust' 'cargo') 
makedepends=('rust' 'cargo') 
source=("$pkgname-$pkgver.tar.gz::https://github.com/sricharanandra/rustybrain/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

post_install() {
    echo "thank you for installing me. type 'rustybrain' in your terminal to get started."
}

post_update() {
    echo "thank you for updating me. type 'rustybrain to check out if anything new has been added.'"
}

