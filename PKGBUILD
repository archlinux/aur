# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="typioca"
pkgname="${_pkgname}-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="Minimal, terminal based typing speed tester"
arch=('x86_64')
url="https://github.com/bloznelis/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('d84a639a9c40f495c35f0e8ad7feec85f6bcb21a9c471dc93bd38cb5822d49c3'
            '4dfb396be86063cc1ad0fb6978d72632005f38884ef5a5457d8502302e2b7cc7')
sha256sums_x86_64=('e4c3cbd08e8c2ab12fb02fdc664b6ea555d508eb4c66358eda42921331a3a0ca')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
