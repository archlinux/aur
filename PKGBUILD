# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jmacdonald
_pkgname=amp
pkgname=${_pkgname}-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-unknown-linux-musl"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")

sha256sums=('b9d3a1fcbdc683ce680a7c7f4f36570ba6772329fe02232a517659fecab56db3'
            '3590d46a5adacf8f603aa7566d3a14d4d0cee7acdf8aa1887d7e212372938e89'
            '0f67e01715a86ebbc0acfbd275dc79e8868c1c7942559be1854574e4e5c21ca1'
            'a7b2b1e8d74a19ea932d5882303452a215a78a8a6a713270b51bc99ec1a71df2')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
