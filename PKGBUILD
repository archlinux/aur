# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=casey
_pkgname=filepack
pkgname=${_pkgname}-bin
pkgver=0.0.9
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
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            '54b802c116eb472af4a3cbd9e8e993f06473c74639797fda352b974e35220e12'
            '8e3b78a1b52970e2136cc6fcb585f30459e78c214017126cb3167058f33d694b')
sha256sums_x86_64=('4bfe2ae289b0b1956ca4b6cf6a2a84b1b0863b3b0fd05f20e6e5ee9de5b7e746')
sha256sums_aarch64=('007f5fb4b41aea2a8d7a28292ce756df49b60b128c9d435aa6113f632a81d9ef')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
