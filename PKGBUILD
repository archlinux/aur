# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=lindell
_pkgname=multi-gitter
pkgname=${_pkgname}-bin
pkgver=0.57.0
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
            '0bceeb9db3a47b9369deef3ddf381bf3e86e72ab41f0ec79262ed409de6a62c5'
            'd9c8b4d1b1ffc87aad0ed53e624728c255471df6ed3a9dc1742cf967eaf21f3e'
            '1463e52e037e1f6041a738067c6dec236a8a9f1a01780d9252c5c66a83395f3d'
            '587cc79b24eaa2f1e3070d4d87cdc624126b0321281f83585383508ca12725cd'
            '0b0392358177e2db7a2ae82c5f8b41dba87e32b5498a42c6878716e69369db02')
sha256sums_x86_64=('ed6bc7205b7e3a2cd43404715a395d343b4ce6adc5ce249751523fa7e243dbff')
sha256sums_i686=('cfee3ac02b8d3146db88f09e1983bc7c26c5ffdc3b3424714fe7ef2d6920adf1')
sha256sums_aarch64=('7a24ab4c34eb5f4b21ccf422aaca47035dac0089d13a66d3a76558e996fbc807')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
