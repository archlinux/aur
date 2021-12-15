pkgname=zash
pkgver=0.3.1
pkgrel=1
pkgdesc='Zash - A Zuper Awesome Shell'
arch=('x86_64' 'aarch64')
url='https://github.com/robiot/zash'
license=('GPL-3.0')
makedepends=('cargo')
sha512sums=('SKIP')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
install=zash.install

build() {
  cd $pkgname-$pkgver

  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}