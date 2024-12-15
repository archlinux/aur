# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="okteto"
_pkgname="${_name}-beta"
pkgname="${_pkgname}-bin"
pkgver=3.2.1
_pkgver="${pkgver//beta/-beta\.}"
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('x86_64' 'aarch64')
url="https://www.okteto.com"
_url="https://github.com/${_name}/${_name}"
license=('Apache-2.0')
optdepends=('kubectl')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/${_pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/${_pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/${_pkgver}/${_name}-Linux-x86_64")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/${_pkgver}/${_name}-Linux-arm64")
sha256sums=('a2c56e36240495668f725dd64ef4fc951ef31a1b6934a578eef1bd545c1de353'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('2c5b2ccd20aec10dd2ffa3d6d8b45084d49f57525b47ef9ad88e6ecfeebfa439')
sha256sums_aarch64=('acd0daef4940dd9373169fc3d98efc1c5166c069c76bb9b95f85c3d2a71d6b77')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
