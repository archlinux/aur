# Maintainer: Birdman <bn0010100@gmail.com>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=go-algorand
pkgver=4.0.1
pkgrel=1
pkgdesc="Implementation of the Algorand protocol and node software"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
backup=('var/lib/algorand/genesis.json' 'var/lib/algorand/system.json')
depends=("systemd")
provides=("go-algorand")
conflicts=("go-algorand")
install=go-algorand.install
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-${pkgver}-1.x86_64.rpm")
sha384sums=('7e245afecb5fdaa8a717ae44ffbbac07cb9f0911bbc9263f092d7b71296f8ea76c525c3c6d0e9472ab4c84565ae7d45d')

package() {
  cd "${srcdir}"

  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/var/lib/algorand"
  cp -r var/lib/algorand/ "${pkgdir}/var/lib/"

  install -Dm644 lib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
}
