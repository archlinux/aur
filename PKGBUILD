pkgname=genenv
pkgver=1.1.0
pkgrel=1
pkgdesc='Generate .env.example from .env file'
arch=('x86_64' 'aarch64')
url='https://github.com/robiot/genenv'
license=('GPL-3.0')
makedepends=('cargo')
sha512sums=('SKIP')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver

  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
