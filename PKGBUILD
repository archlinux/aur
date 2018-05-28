# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=pkg2zip
pkgver=1.8
pkgrel=1
pkgdesc='Decrypts PlayStation Vita pkg file and packages to zip archive'
url='https://github.com/mmozeiko/pkg2zip'
arch=('i686' 'x86_64')
license=('custom:unlicense')
source=("https://github.com/mmozeiko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4290b37a41ab4c0044aebd90fbea973bd5950ed1fdb0c06011067c4be9103f3a')

package() {

  cd "${srcdir}"/"${pkgname}-${pkgver}"
  make CFLAGS="-DNDEBUG -O2 -Wno-format-truncation"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm755 pkg2zip "${pkgdir}"/usr/bin/pkg2zip
}
