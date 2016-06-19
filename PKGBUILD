# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=hexchat-autoaway
pkgver=1.0.3
pkgrel=2
pkgdesc="A HexChat plugin to set away on idle"
arch=('i686' 'x86_64')
url="https://github.com/andreyv/hexchat-autoaway"
license=('GPL3')
depends=('hexchat' 'libxss')
makedepends=('cmake')
conflicts=('hexchat-autoaway-git')
source=("https://github.com/andreyv/hexchat-autoaway/archive/v${pkgver}.tar.gz")
sha256sums=('35367a4e0d6f1c83ec36f2ae11d9274cd874aa990f69c8b8690cca4045709e80')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
