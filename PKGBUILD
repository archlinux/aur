pkgname='libx360-git'  
pkgver='1.0.0'                
pkgrel=1                      
pkgdesc='Tools for working with x360 format media.'
arch=('x86_64')                
url='https://github.com/WilkerSebastian/libX360'
license=('GPL-2.0-or-later')
depends=('gcc-libs')          
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver::git+https://github.com/WilkerSebastian/libX360.git#branch=main")
sha256sums=('SKIP')            

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/x360" "$pkgdir/usr/bin/x360"
}