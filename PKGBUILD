# Maintainer: Jonathan Mast <jon@jonmast.com>
# Based on nushell package, but uses prebuilt binary

pkgname=nushell-bin
pkgver=0.2.0
underscoredpkgver=0_2_0
pkgrel=1
depends=('openssl' 'zlib')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
conflicts=('nushell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/releases/download/$pkgver/nu_${underscoredpkgver}_linux.tar.gz")
url="http://nushell.sh"
license=('MIT')
sha256sums=('5ea42e58f0ce6952298beb926f7b5b5dabe9a4da6e08144ca6a52069bafaeeef')

build() {
  return 0
}

package() {
  cd "$srcdir/nushell"

  install -dm755 "${pkgdir}/usr/bin/"

  cp nu "${pkgdir}/usr/bin/"

  # Pull in all plugins
  cp nu_plugin_* "${pkgdir}/usr/bin/"
}
