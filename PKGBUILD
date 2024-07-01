# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="lstags"
pkgname="${_pkgname}-bin"
pkgver=1.2.23
pkgrel=1
pkgdesc="Manipulate Docker images across different registries"
arch=('x86_64')
url="https://github.com/ivanilves/${_pkgname}"
license=('Apache-2.0')
depends=('docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}.tar.gz")
sha256sums=('dae24abc09b82bae822690e8500662f04a8f3661dcc1bf2bb6d07cf5fb4778f0'
            'b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')
sha256sums_x86_64=('7603585398d0237b30ccffccd8db2c83290cd7bbe6e08648406b3272a3bfd662')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
