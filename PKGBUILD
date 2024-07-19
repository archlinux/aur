# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: simonsmh <simonsmh@gmail.com>

_pkgname="okteto"
pkgname="${_pkgname}-bin"
pkgver=2.29.2
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
optdepends=('kubectl')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
sha256sums=('5dcc00c6e480f2d20da2a7a4e5a7083c882e5296e0671909e3d144c8357798f8'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('e0eb3b4de3960b4432f7a39f306287a46096cecb8a35fa0ae62e6bfc9bc9ccd6')
sha256sums_aarch64=('226b4165a6fe8dfb3ec6deb30e2f946265d54ea934cf229500f20d455c68576a')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
