# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bmatsuo
_pkgname=jqsh
pkgname=${_pkgname}-bin
pkgver=0.5
pkgrel=1
pkgdesc='An interactive wrapper to the jq command line utility'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}${pkgver}.linux-amd64.tar.gz")
sha256sums=('714e618800943dd1982b3abc29882b3b8b677c3b477abc95ee80311f6d03f20c'
            'b3b058899e95cc4ac9a07ebeac27c1d527ea7b2fab247c94ca82a3a755507eb1')
sha256sums_x86_64=('2d9a876cd140dbaaed67a874b8a6bb6a017e707f555bfbe740b13b75534896a3')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
