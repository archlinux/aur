# Maintainer: evertonstz

pkgname=pkg2zip-fork
pkgver=2.3
pkgrel=2
pkgdesc="This is for lusid1's fork, recomended by NoPayStation. Decrypts PlayStation Vita pkg file and packages to zip archive"
url='https://github.com/lusid1/pkg2zip'
arch=('i686' 'x86_64')
license=('custom:unlicense')
source=("https://github.com/lusid1/pkg2zip/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
cd "${srcdir}"/"pkg2zip-${pkgver}"
make CFLAGS="-DNDEBUG -O2 -Wno-format-truncation"
}

package() {
  cd "${srcdir}"/"pkg2zip-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pkg2zip/LICENSE"
  install -Dm755 pkg2zip "${pkgdir}/usr/bin/pkg2zip"
}
