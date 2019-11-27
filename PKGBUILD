# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.6.0
pkgrel=1
makedepends=('rustup')
depends=('openssl' 'zlib' 'e2fsprogs')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
sha256sums=('90cdd83410d23e32fd47457d227b00cb2c8f607ac38020360eea0e385b693707')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
	--all-features \
	--locked \
	--root "${pkgdir}"/usr \
	--path "./" 
}

