# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lindell
_pkgname=multi-gitter
pkgname=${_pkgname}-bin
pkgver=0.63.0
pkgrel=1
pkgdesc='Update multiple repositories in with one command'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "CODE_OF_CONDUCT-${pkgver}.md::${_urlraw}/CODE_OF_CONDUCT.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_ARM64.tar.gz")
sha256sums=('3b745d0137c549ead584cb8c88f8f5bedf3cbc774891ff8b7382136a5c8672b2'
            'cb211f8ef19d2d872982ccaa2c46466e2a072d15843edfc43cd8021a541b3e03'
            'd9c8b4d1b1ffc87aad0ed53e624728c255471df6ed3a9dc1742cf967eaf21f3e'
            '0f0b5b07f353f20a73c348209d3b9f30d51d009c21178265446c3ed50aedc74b'
            '587cc79b24eaa2f1e3070d4d87cdc624126b0321281f83585383508ca12725cd'
            '0b0392358177e2db7a2ae82c5f8b41dba87e32b5498a42c6878716e69369db02')
sha256sums_x86_64=('f58bb5230d9acb39415b8dc38cb179dcce63eb46954a61e24b4ccb71943fc17e')
sha256sums_i686=('98e0fb10ee62cfbb84d207abdfa07626dc15b5bbcf2367ce6fe386d894dae88e')
sha256sums_aarch64=('3f915480a681b7b52dd3ad847e2ef25e4b0bafc9199473ab9eef2fa94c77cd9c')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
