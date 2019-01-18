# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Christoph Vigano <mail@cvigano.de>
pkgname=passdmenu
pkgver=1.2.0
pkgrel=1
pkgdesc="A dmenu frontend to pass with clipboard and autotype functionality for user and password."
arch=(any)
url="https://github.com/klaasb/passdmenu"
license=('ISC')
conflicts=('passdmenu-git')
depends=('python' 'xclip' 'dmenu')
optdepends=('xdotool: autotype functionality')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/klaasb/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('879d984d28b24b3335ddcae204e7b8b9430a3b5e05ba332e53c94de7d9cb6d74')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 passdmenu.py "${pkgdir}/usr/bin/passdmenu"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
