# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sachaos
_pkgname=todoist
pkgname=${_pkgname}-bin
pkgver=0.25.0
pkgrel=1
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
            '3d677aca025a713ead8a03ef497119adb907c8db1ca00bc8b8ae522283938ef0')
sha256sums_x86_64=('35c339c27369c3ea2c7145f669a9e1f8776b68bc6334eb8b98e6ce92e5bd88dd')
sha256sums_i686=('82dcec08b4e86dff62564616add595a25b0bd9cb95eba886ffaaf06999b038fc')
sha256sums_aarch64=('3aa6b7cb0b65d8b687ea3f6f4d2fbe65a7123285d47d5ab02036c09627cbe5c7')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
