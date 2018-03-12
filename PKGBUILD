# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.8.4
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip")
sha512sums=('566e6e64168fae0c95022372f213082e4e3b79cb2e27cf090f4b17d82d19410a7af7b9a885286ba8ed8e0f5768294f9be4ee5697e88ef8af51183a83010ba57d')

build() {
  cd "$srcdir"/src
  make
}

package() {
  cd "$srcdir"/src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
