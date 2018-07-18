# Maintainer: Chris Trotman <chris@trotman.io>

pkgname=ec2-ip
pkgver=0.1.0
pkgrel=1
pkgdesc="Easily find EC2 instance ip addresses"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/solarnz/ec2-ip"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/solarnz/$pkgname/tar.gz/v$pkgver)
sha256sums=('2d5a9f9d72c5c3192455c8a6a6d167708f84b0d8e0b39b5896941a539a82d748')
provides=('skim')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo install --root "${pkgdir}/usr"
  rm -f "${pkgdir}/usr/.crates.toml"
}
