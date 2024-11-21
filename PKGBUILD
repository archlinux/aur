# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=casey
_pkgname=filepack
pkgname=${_pkgname}-bin
pkgver=0.0.6
pkgrel=1
pkgdesc='Command-line file hashing and verification utility written in Rust'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('custom:CC0')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "DESIGN-${pkgver}.md::${_urlraw}/DESIGN.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            '3ad90a75ac9f0bd68fa11298c9ddf1fda286d050776ddc8a705bfc29ed5974b4'
            'c1865d4420ca204ea3fbc52444ae4ff44d3f1d8d356512fca242fcaa78ee9fcb'
            '3d6644688f86710083ba97ae293d210a327fe4ca7190cae92402ca4adfa44f03')
sha256sums_x86_64=('dc7424aad8b4544599a0ba419b54b5370974224ce8bf451615b8dc9475832bdc')
sha256sums_aarch64=('20980513a35efed491b69e18d9e7cf058b77c56fa0a2ef1419f6719617b6a6b4')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
