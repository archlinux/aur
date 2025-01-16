# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sachaos
_pkgname=todoist
pkgname=${_pkgname}-bin
pkgver=0.22.0
pkgrel=2
pkgdesc='Todoist CLI Client, written in Golang.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('d570f605a0fcedf7c47c390807dc37a0ffbbce5e291c8ce4c684044ede428c6f'
            'c3a670fec633f1d9ef4b9cfd1c124495b26dd9b29c7247656d91fe250933b00d')
sha256sums_x86_64=('9980c4aa5c0d6c587b4ad4c40a536b2a39c65feff5afc095642a308205174f93')
sha256sums_i686=('f6a03124a413fe00b6f7888d6de88ebafb1edd872e16ff2aa82123e54e02e6f2')
sha256sums_aarch64=('0d310c1d0a28a91c7d6b138c8d43f9252635972b44ee49ecf9d6d50298e0dcc6')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
