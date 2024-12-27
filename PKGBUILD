# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Systemcluster
_pkgname=wrappe
pkgname=${_pkgname}-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Packer for creating self-contained single-binary applications from executables and directories'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux")
sha256sums=('d58ac9ac6ec1e81f7028f5dbce0fa252dae0ee540dd970c929b7dfd18d3589c3'
            '9175d3bfd3615591644fe79adec36c22eaa41322b5f282414cd74b6a16ee774f')
sha256sums_x86_64=('280628ed3454a73e172bdd19b045e3797942786f8b676ac6fa45df836be2c0fe')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
