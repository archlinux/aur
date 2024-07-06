# Maintainer: VIVID <vivid@headrat.org>

pkgname=libg15render
epoch=1
pkgver=1.3.1
pkgrel=1
pkgdesc="Library to aid in drawing to Logitech G15 screens"
arch=('x86_64')
url="https://github.com/vividnightmare/libg15render"
license=('GPL')
depends=('libg15' 'freetype2')
source=(https://github.com/vividnightmare/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('c5bc04e281506415c4b559fde08f48e30b34cc6fdd47ca1765cefcf9eeb8aa82ad0902204d35358db36deebc491d8b8bdfb0d82741393f36dd7be5f80d12461c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  chmod +x configure
  ./configure --prefix=/usr --enable-ttf
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
