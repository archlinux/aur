# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.7.7
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
provides=('quickbms')
conflicts=('quickbms')
# options='!emptydirs'
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip")
sha512sums=('bec711aa7e189fc2e9bf09ed005a406cc8f698176c7018b03086c0eacccd85a03c4715264f93d6b0ae49b646d1a839ee2674dc3b99f48a259472e61788044f11')

build() {
  cd $srcdir/src
  make
}

package() {
  install -Dm755 "$srcdir/src/quickbms" "$pkgdir/usr/bin/quickbms"
}

# vim:set ts=2 sw=2 et:
