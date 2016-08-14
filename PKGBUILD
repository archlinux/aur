# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=hexchat-autoaway
pkgver=2.0
pkgrel=1
pkgdesc="A HexChat plugin to set away on idle"
arch=('i686' 'x86_64')
url="https://github.com/andreyv/hexchat-autoaway"
license=('GPL3')
depends=('hexchat' 'libxss')
makedepends=('cmake')
conflicts=('hexchat-autoaway-git')
source=("https://github.com/andreyv/hexchat-autoaway/archive/v${pkgver}.tar.gz")
sha256sums=('608ba6b934869a5fe5d7402a178e2a24101d71eda2cb9b4b19e09058023eb8dc')

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
