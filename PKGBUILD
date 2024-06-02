# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=mangl
pkgver=1.1.5
pkgrel=1
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'glfw' 'libgl' 'freetype2')
optdepends=('fontconfig: set custom font')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8bbbadb66d1cb30d7e914e5b71993997e67c59103c55c8601410eeda35062157')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure && make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" MANDIR="/usr/share/man" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
