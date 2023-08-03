# Maintainer: jkl
# Contributor: Kyler Eastridge

pkgname=quickbms
pkgver=0.12.0
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends_i686=('lzo' 'bzip2' 'zlib' 'openssl')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("https://aluigi.altervista.org/papers/quickbms-src-$pkgver.zip"
        "0001-Fix-OpenSSL-V21-padding-deprecation.patch")
sha512sums=('dc42fa71743f00222f5062c38906d33c888713bc2daf68ea63223f3346370bc100093e6f9c7bfe5fd0c4ea9024b7b336f3ae54ec95204fdaf891f5c9734419e3'
            '397b1811ecd7ca90aa9579f5c2dad293a9cfce1955850c3f2964bba440d19dbbe49865c6ed6ed1514eb9ee4ce7928c15455544a540042290480f411b568f62ad')

prepare() {
  cd src
  patch --binary < ../0001-Fix-OpenSSL-V21-padding-deprecation.patch
}

build() {
  cd src
  make
}

package() {
  cd src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
