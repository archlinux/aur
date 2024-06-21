# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=typioca
pkgname=${_pkgname}-bin
pkgver=2.11.2
pkgrel=1
pkgdesc="Minimal, terminal based typing speed tester"
arch=('x86_64')
url="https://github.com/bloznelis/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/${pkgver}/README.md"
        "${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('aecdee56e5d0a7f51e5b86bd07671443910e21d3af7511f1756752c9f4c7d214'
            '4dfb396be86063cc1ad0fb6978d72632005f38884ef5a5457d8502302e2b7cc7')
sha256sums_x86_64=('b94d984e3a979add3e9ae7d3a36f47da69ec0314caab5ef55d04bc6402a800ea')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}