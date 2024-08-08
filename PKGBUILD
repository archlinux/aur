# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: simonsmh <simonsmh@gmail.com>

_pkgname="okteto"
pkgname="${_pkgname}-bin"
pkgver=2.30.0
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
sha256sums_x86_64=('c9a414b05f8248022f0135996b5d8ba7cc8ff4766d8a6c68102531db5516d82f')
sha256sums_aarch64=('b13bd409bb3b67b61603fc753b87275e6cae0c1648501eefd0f92464afe5f757')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
