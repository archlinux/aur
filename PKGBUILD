# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=lindell
_pkgname=multi-gitter
pkgname=${_pkgname}-bin
pkgver=0.58.0
pkgrel=1
pkgdesc='Update multiple repositories in with one command'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
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
            'e580731e8f4e2355fd50046a68484886cbcaaca73680e7d4e6b3a0fd5088b1d9'
            'd9c8b4d1b1ffc87aad0ed53e624728c255471df6ed3a9dc1742cf967eaf21f3e'
            '7f073b81eaec6f74e2ce906fb9537688fd90f03dab13bf10366d5ac090eebaf4'
            '587cc79b24eaa2f1e3070d4d87cdc624126b0321281f83585383508ca12725cd'
            '0b0392358177e2db7a2ae82c5f8b41dba87e32b5498a42c6878716e69369db02')
sha256sums_x86_64=('3212dc921f8aa3e6908eed23c9ce6244ee89aaeb6736001f790edc482e9bb653')
sha256sums_i686=('55a757d3141604723fcf989f50d68ec4639e95064e63d40a83121de49a209aa3')
sha256sums_aarch64=('38a0fc52aebd8f67b2fd9bcc512aaffebfddd4b57748193136319ccf2c1633ea')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
