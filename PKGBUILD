# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: simonsmh <simonsmh@gmail.com>

_pkgname="okteto"
pkgname="${_pkgname}-bin"
pkgver=2.29.0
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
optdepends=('kubectl')
_pkgsrc="${_pkgname}-${pkgver}"
source=(${url}/raw/${pkgver}/{README.md,LICENSE})
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
sha256sums=('5dcc00c6e480f2d20da2a7a4e5a7083c882e5296e0671909e3d144c8357798f8'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('7ae1f2030b297027d0226f3bd73dcba536a0219bc514dd10e3844c31f849d1be')
sha256sums_aarch64=('7de75f13f67711be33ff9cac3af662ff37473c0953b571498395c76d6ef57627')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
