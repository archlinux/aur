# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=purpleclay
_pkgname=gpg-import
pkgname=${_pkgname}-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Easily import a GPG key within any CI workflow'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('5babf02a83e426450bd589ce25d16ca8387f7bd31077e444a4c6b00748332361'
            'af71c770d96feffac4dfa21ebbd4c68447e078ec6253e4704b227b4c4d9c6be6')
sha256sums_x86_64=('f04f7d528ac07a6770c8be359e82a68097328224d1cede2dc5af0221913e0e72')
sha256sums_aarch64=('5628b92b80887f7b89f0aaecc074895e166ceb7255908fe67ff070dcdcfb2190')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
