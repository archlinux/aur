# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgexec=mpm
_pkgauthor=kdeldycke
_pkgname=meta-package-manager
pkgname=${_pkgname}-bin
pkgver=5.21.0
pkgrel=1
pkgdesc='A wrapper around all package managers'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/license"
        "README-${pkgver}.md::${_urlraw}/readme.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md")
source_x86_64=("${_pkgexec}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgexec}-linux-x64.bin")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'a8fe415a57079e8b22c516e1808b82faf4747ecdb7e92f01090b27873cc3b7c5'
            '6f547d2472b471f040870126c2a2bbef95d53d8c1e6451388a64e13a006a077b')
sha256sums_x86_64=('a875cf3f76a20e7aeee6fc1bafe76481ad79229e605c9cac8ce66c7d97ff5df7')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
