# Maintainer: Chris Trotman <chris@trotman.io>

pkgname=ec2-ip
pkgver=0.1.2
pkgrel=2
pkgdesc="Easily find EC2 instance ip addresses"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/solarnz/ec2-ip"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/solarnz/$pkgname/tar.gz/v$pkgver)
sha256sums=('1daa2d8a7de2581754b9e2faf13dc90296ace4f8924030b3f6d6ff748cb2ed24')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo install --root "${pkgdir}/usr"
  rm -f "${pkgdir}/usr/.crates.toml"
}
