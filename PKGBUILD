# Maintainer: Yujon Pradhananga <yujonpradhananga@gmail.com>
pkgname=yujons-counter-strafe-trainer
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based counter-strafe mechanics trainer for tactical FPS games like Counter-Strike 2 and Valorant"
arch=('x86_64')
url="https://github.com/Yujonpradhananga/yujons-counter-strafe-trainer"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yujonpradhananga/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('520cf8e52a5c20aed7f5cd55baa07eda7b814f4065b7720cdd0d0fe406c26c4a')  

build() {
    cd "$srcdir"/$pkgname-$pkgver
    export GO111MODULE=on
    go build -o "$pkgname"
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    
   
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
