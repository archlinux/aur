# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="workspace"
pkgname="${_pkgname}-bin"
pkgver=1.3.3
pkgrel=1
pkgdesc="Install and manage all your repositories in your chosen destination"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/gaskam/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-linux.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-baseline.zip"
)
sha256sums=('7039458ded95d105681aee475e4e9411133f27f78532a6feda54def26c00dfd7'
            '30350d4346c218c92e7020c2388554bd237132d6c4317bb6060d726276561ae9')
sha256sums_aarch64=('1eca2600dcaee3c4824f611759c1ab9fcd0f20afa8b555a60a57e47091893c6b')
sha256sums_x86_64=('d5f64e9170d8b63fac6419f479347dc0926bf87d905bada9f34345d37e0a7a46')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
