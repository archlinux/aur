pkgname=zash
pkgver=0.1.0
pkgrel=1
pkgdesc='Zash - A Zuper Awesome Shell'
arch=('x86_64' 'aarch64')
url='https://github.com/robiot/zash'
license=('GPL-3.0')
makedepends=('cargo')
sha512sums=('SKIP')
source=("git+https://github.com/robiot/$pkgname.git")
install=zash.install

build() {
  cd $pkgname

  cargo build --release
}

package() {
  cd $pkgname
  install -Dm 755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}