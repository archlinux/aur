# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.3.0
pkgrel=4
makedepends=('rust-nightly' 'cargo')
depends=('openssl' 'zlib')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
sha256sums=('0151f1a09b76c83b7e20932e5e3b0d3af41d32a7862e070ef1b3d5f1163b2876')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"

  cargo +nightly install \
    --no-track \
	--locked \
	--all-features \
	--root "${pkgdir}"/usr \
	--path "./" \
	-Z install-upgrade
}

