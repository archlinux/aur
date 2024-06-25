# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=vault-unseal
pkgver=0.5.1
pkgrel=1
pkgdesc="Auto-unseal utility for Hashicorp Vault"
arch=('any')
url="https://github.com/lrstanley/${pkgname}"
license=('MIT')
makedepends=('make' 'go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ca5272f691c2374aac11d5318c7faf928ba7c9a3eea51197a58810b97bc7a761')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
