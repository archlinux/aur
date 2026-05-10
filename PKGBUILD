# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lindell
_pkgname=multi-gitter
pkgname=${_pkgname}-bin
pkgver=0.63.1
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
            '7ac986551982b33d064ae9b98712852e3c32d4c8bd0fe3bffdf181baa3cd51d4'
            '587cc79b24eaa2f1e3070d4d87cdc624126b0321281f83585383508ca12725cd'
            '0b0392358177e2db7a2ae82c5f8b41dba87e32b5498a42c6878716e69369db02')
sha256sums_x86_64=('94711a96c75975be9cfd9f3bd1d94a371b85716ac40be35f50b7b4cd271caf8d')
sha256sums_i686=('dfa12517e49c2498cce5ecd005bb7778754d5c33818f6da0a73d695e1a70ec41')
sha256sums_aarch64=('f4afde8bf0ab46a433901615e579f3c139ee0347162d615399d4e805e622c1ea')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
