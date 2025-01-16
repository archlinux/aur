# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sachaos
_pkgname=toggl
pkgname=${_pkgname}-bin
pkgver=0.6.1
pkgrel=2
pkgdesc='Toggl CLI Client, written in Golang.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('d570f605a0fcedf7c47c390807dc37a0ffbbce5e291c8ce4c684044ede428c6f'
            '7bcd6b3e37d36b8b4f19f24f728c36e474e1b6640bb73b29e636165d85cc86a0')
sha256sums_x86_64=('5340563b946763bed7f4145171396519721adb7dda654bce4788d013396aebae')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
