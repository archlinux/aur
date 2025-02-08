# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="okteto"
_pkgname="${_name}-beta"
pkgname="${_pkgname}-bin"
pkgver=3.4.0
_pkgver="${pkgver//beta/-beta\.}"
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('aarch64' 'x86_64')
url="https://www.okteto.com"
_url="https://github.com/${_name}/${_name}"
license=('Apache-2.0')
optdepends=('kubectl')
provides=("${_name}" "${_pkgname}")
conflicts=("${_name}" "${_pkgname}")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${_pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${_pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/${_pkgver}/${_name}-Linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/${_pkgver}/${_name}-Linux-x86_64")
sha256sums=('a2c56e36240495668f725dd64ef4fc951ef31a1b6934a578eef1bd545c1de353'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('fa8dc179497ceb155ba737e6d1fbc320a8b237b6cc5e094740f1e592f2ee9c87')
sha256sums_x86_64=('3cd1ffe66c3feaa83b2aed44c43e50ce2a316e6531ec30667c49bc845b5e49c0')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
