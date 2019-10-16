# Maintainer: Bumsik Kim <k.bumsik@gmail.com>
# Scripts inspired by nushell-git package

pkgname=nushell
cargoname=nu
pkgver=0.4.0
pkgrel=1
makedepends=('rustup')
depends=('openssl' 'zlib')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/archive/$pkgver.tar.gz")
url="http://nushell.sh"
license=('MIT')
sha256sums=('7111d3067db3dabc6137e8a441670de0fae63deae522d1675fc77402948f2c67')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"

  cargo +beta install \
	--all-features \
	--locked \
	--root "${pkgdir}"/usr \
	--path "./" \
   || ( >&2 echo $'\nInstall Cargo Beta compiler:'\
		$'\n\n\trustup install beta    (no root required)'\
		$'\n\nThen try building nushell again.'\
       && false )
}

