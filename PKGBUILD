# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wallet-tracker"
pkgname="${_pkgname}-bin"
pkgver=2.0.4
pkgrel=1
pkgdesc="Detect real scammers from anywhere"
arch=('x86_64' 'aarch64')
url="https://github.com/aydinnyunus/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('edfa5a00f3665f029a9146a736c43ddc06fae680db352878cd6b17ce9db9e78e'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2d79790e5eea9a1f7cc5c7de8032ab34a5d05cec1dfab02e384c12ce32cf1dfb')
sha256sums_aarch64=('0f964edd8431ef08a6c23303200721f075fd302929732db45f0b372b100eec3c')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
