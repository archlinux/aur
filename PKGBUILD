# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: simonsmh <simonsmh@gmail.com>

_pkgname="okteto"
pkgname="${_pkgname}-bin"
pkgver=2.30.1
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
optdepends=('kubectl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
sha256sums=('5dcc00c6e480f2d20da2a7a4e5a7083c882e5296e0671909e3d144c8357798f8'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('761b83083f701bcf0efdb75fe065b739a0ab1378ac97cc96b1b09bd9c40b8d95')
sha256sums_aarch64=('341e52e0fc9277fac00e80545f6738ffe5f26981fc97bae1f9153b611b26407a')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
