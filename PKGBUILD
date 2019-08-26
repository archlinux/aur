# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.2.0
pkgrel=4
makedepends=('rust-nightly' 'cargo')
depends=('openssl' 'zlib')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
sha256sums=('5bce8cdb33a6580ff15214322bc66945c0b4d93375056865ad30e0415fece3de')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"

  cargo +nightly install \
    --no-track \
	--locked \
	--features rawkey,clipboard \
	--root "${pkgdir}"/usr \
	--path "./" \
	-Z install-upgrade
}

