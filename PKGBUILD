# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.6.1
pkgrel=1
makedepends=('rustup')
depends=('openssl' 'zlib' 'e2fsprogs')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
# Use updpkgsums to update the checksum
sha256sums=('3f7878df7d77fe330e6840428845800d9eefc2ad8248617c42004030ecf527f0')

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

