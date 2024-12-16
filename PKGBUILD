# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=triyanox
_pkgname=lla
pkgname=${_pkgname}-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Blazing fast 'ls' replacement with superpowers"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-i686")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
sha256sums=('23d576c778cda4c3059f8dccbb8b4b79965868099472d089ec589ed0066999c5'
            '949bc98431d1b7d1b9fc759d57f85b0443b7bb1e174e62e864a491bf6a936232')
sha256sums_x86_64=('3573e82e1e01ee2437ff657485e91e4f77d9d7d6cd6da4221c611b479932a55a')
sha256sums_i686=('9092ff74ad46fd2a816f2259ced93d14a08fb8b66a61f3e9f0e8d8dea1b58869')
sha256sums_aarch64=('a3b651a637986f58e62a13dfa09287d8b8442a7364b0ee14fa3031103fabef71')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
