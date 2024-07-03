# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="mole"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=2
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64' 'aarch64' 'arm')
url="https://davrodpin.github.io/${_pkgname}"
_url="https://github.com/davrodpin/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_url}/raw/v${pkgver}/{README.md,LICENSE})
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgname}${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}${pkgver}.linux-arm64.tar.gz")
source_arm=("${_url}/releases/download/v${pkgver}/${_pkgname}${pkgver}.linux-arm.tar.gz")
sha256sums=('d01788316d6a866cdd0b75c7b144b66e09570d73db3877f6fa60728ab2d04dca'
            '7e7839a3eb39cd8fa942a0ceeeac3ad214ec7d03b4be72da318ca0c15b1fb3a7')
sha256sums_x86_64=('fd38d9f529181651b230c013825849fc467292fa11c44b27b0c21c579f883d82')
sha256sums_aarch64=('12c9077a9f8fe3fbb63a3cc23e85bd0b0b5cbd2efcd11bd5867d8b3c07b2ea2f')
sha256sums_arm=('8af1a88c59dc241e74868778b642048c59f28af8a7b08db7209df560c387a088')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
