# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=lindell
_pkgname=multi-gitter
pkgname=${_pkgname}-bin
pkgver=0.57.1
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
            'f29ff3ff95234e24bfbb98c81bd236ee126f8226608cf93f450f5b08ab7ef603'
            'd9c8b4d1b1ffc87aad0ed53e624728c255471df6ed3a9dc1742cf967eaf21f3e'
            'cab761973751f9a44cd2a349fc93a997c1bf1c61c67d448a293b0e6e6dbf7e14'
            '587cc79b24eaa2f1e3070d4d87cdc624126b0321281f83585383508ca12725cd'
            '0b0392358177e2db7a2ae82c5f8b41dba87e32b5498a42c6878716e69369db02')
sha256sums_x86_64=('5be34d1c08d8fb8feae7a9e94b0add948a4d8607606a65f7795cbf7fb0ebf54f')
sha256sums_i686=('aff8c091d78d2005b9409cffd7e4295559721ee8847fc3641cb8c943b2070eb0')
sha256sums_aarch64=('639000ed71593b4dac61398e65f7d81931b1e49c1f8aee31ba5d53bc825c4860')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
