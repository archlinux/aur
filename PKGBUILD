# Maintainer: Chris Trotman <chris@trotman.io>

pkgname=ec2-ip
pkgver=0.1.1
pkgrel=2
pkgdesc="Easily find EC2 instance ip addresses"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/solarnz/ec2-ip"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/solarnz/$pkgname/tar.gz/v$pkgver)
sha256sums=('e66ea1e5d1c2aa006553f6908970aee003d355913dbb91b0b69b53ba5d5bc456')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo install --root "${pkgdir}/usr"
  rm -f "${pkgdir}/usr/.crates.toml"
}
