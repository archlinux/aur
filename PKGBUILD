# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.8.3
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip")
sha512sums=('ca868b82941e94d89d498d6f49d6c0db155ca8cb0554e8237e5bb5559d00dfc9a1ea5b5f0cf0cb1d17aaee8e7cea0fad69f4412976d539048bc72748f2cb424f')

build() {
  cd "$srcdir"/src
  make
}

package() {
  cd "$srcdir"/src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
