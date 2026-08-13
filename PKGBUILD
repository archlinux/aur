# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sachaos
_pkgname=todoist
pkgname=${_pkgname}-bin
pkgver=0.24.0
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
            'f759b9c6f2d438ad69f8fab08ad89cd7f700b60677ea0d450736ce9a959cbc59')
sha256sums_x86_64=('a0bdb631ffa2a04769929f4dbc6e2db563093e18e985eb123826e356945c3a94')
sha256sums_i686=('993c33139a2fab2372a0fc3959a2bccd8ad33967982ff57a7c14c99a16697d36')
sha256sums_aarch64=('870335183a818fc4fbd008f4469bdbabc6c34ea74dbee599756d520d7e206ec6')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
