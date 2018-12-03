# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.9.0
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("https://aluigi.altervista.org/papers/quickbms_src_$pkgver.zip")
sha512sums=('b61bede331e808faec5c7c653cb4ece91835319dce59b8a9bdd31b542814a4de85d27aec18d8661cef87e2a170ba88e651c5266bc5e5b823f333b5f94aff1ab9')

build() {
  cd "$srcdir"/src
  make
}

package() {
  cd "$srcdir"/src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
