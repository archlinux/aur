# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="okteto"
_pkgname="${_name}-beta"
pkgname="${_name}-bin"
pkgver=3.2.1beta2
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
sha256sums_x86_64=('094a8be78517a5b2547ad6532b252c5f96a9bf1c5e76f471e6fd6213430f1ac3')
sha256sums_aarch64=('766fde8100ce79450dbd99e67b77ad9dff03b7ad62ac985a56e3432c3570cb3b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
