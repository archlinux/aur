pkgname=rmath
pkgver=0.1.0
pkgrel=1
pkgdesc="A real time calculator i made in rust while i was bored at school"
arch=('x86_64')
url="https://github.com/ColtNovak/rmath"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('cargo' 'rust' 'pkg-config')

source=("git+https://github.com/ColtNovak/rmath.git")
sha512sums=('SKIP') 

options=(!lto)

build() {
  cd "$srcdir/rmath" 

  cargo build --release 
}

package() {
  cd "$srcdir/rmath"

  install -Dm755 "target/release/rmath" "$pkgdir/usr/bin/rmath"

 
}
