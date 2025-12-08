# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=robin-mbg
_pkgname=may
pkgname=${_pkgname}-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='CLI tool to easily list and manage multiple git repositories.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '6efa8986f0b4c2f00f770527299aa2bf3277eff1f85d024c6c6883c6d51d8807')
sha256sums_x86_64=('03a84d3c132788669ade78e2af3f447c491d54fc4c79e5a9df6bfdedb640f5ad')
sha256sums_i686=('34acc69bee95e8ca09cee204c6854651b6b80189decf0dd8c41648da73961ae1')
sha256sums_aarch64=('b89efcb204d948b0c6d72367994a8bcc8e03a8db33b973baf77a0e201ddbdb50')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
