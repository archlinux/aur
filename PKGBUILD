# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.4.2
pkgrel=1
pkgdesc="Command line artificial intelligence - Multi-vendor generation in your terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
source_i686=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_aarch64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
sha256sums=('88c131c17034ff4d9657e5b37ecf622504e346e74192178dfa4c71409640df52'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('584289627753fe077b50b413fbb7de3ccdea17fc816a517c5cf529de75311d47')
sha256sums_i686=('8ad816fe68dc95f8df4f4f2b437286df33abe76b507e871a1c28bb0c2fc7fef5')
sha256sums_aarch64=('afda1a31972f65bc54421baf21bea0d14d819eacd0506e25ed1b4bf70bca8fc4')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
