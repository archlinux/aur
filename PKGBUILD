# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="decoder"
pkgname="qmc-${_binname}"
pkgver=2.5
pkgrel=2
pkgdesc="Fastest & best convert qmc 2 mp3 | flac tools"
arch=('x86_64')
url="https://github.com/Presburger/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('ghc-filesystem')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ae71b9192649f1fe5416a9c57cfd091daa03740079e94af71f3d2f5549b657ab')


build() {
  cd "${srcdir}/${_pkgsrc}/src"
  g++ ${CFLAGS} ${LDFLAGS} -std=c++11 -o "${pkgname}" "${_binname}.cpp"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
