# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=alttch
_pkgname=shd
pkgname=${_pkgname}-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Console tool to display drive list with commonly checked smart info'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'smartmontools')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[1]}")
sha256sums=('48a6732017f3cd9fc0ddc0760faf43d0884550c7cbe2f295a25f73f0e817d112'
            'd71b54e3c7e82e4434cb2057187eda65d3d1e73f5fd646fc5e6440ba037b4ef3')
sha256sums_x86_64=('5f4a7b64cfafa2c86b481ba3796f630a5dd74dc2642b70c25f0be3b6ecaaf8b3')
sha256sums_aarch64=('c78899ac69385bc25981c462b50468389e69f39d58c81e582a1abe40ff39aa21')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
