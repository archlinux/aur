# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: neodarz <neodarz@neodarz.net>

pkgname=terminalimageviewer
_pkgName=TerminalImageViewer
_binname=tiv
pkgver=1.2.1
pkgrel=1
pkgdesc="Small C++ program to display images in a (modern) terminal using RGB ANSI codes and unicode block graphics characters"
arch=('any')
url="https://github.com/stefanhaustein/${_pkgName}"
license=('Apache')
depends=('imagemagick')
makedepends=('make' 'gcc' 'imagemagick')
provides=("${_binname}")
conflicts=("${_binname}")
_pkgsrc="${_pkgName}-${pkgver}"
source=("${_pkgsrc}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08d0c30e3ffa47b69d1bce07bea56f04b7deb4a8a79307ce435a4f0852fbcd5f')

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "src/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
