# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=wallet-tracker
pkgname=${_pkgname}-bin
pkgver=2.0
pkgrel=1
pkgdesc="Detect real scammers with Wallet-Tracker CLI from anywhere"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/aydinnyunus/${_pkgname}"
license=('Apache-2.0')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('edfa5a00f3665f029a9146a736c43ddc06fae680db352878cd6b17ce9db9e78e'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('5d208de198be19e956414800a9543ff5a5a42c77c23e1b33bc1fdbb9e556c553')
sha256sums_i686=('b38ffeb4449a0a704b0a24a7b42df98b6e310276de3e0ef91b70816ce9b9464f')
sha256sums_aarch64=('1186af8b28d22ab07e583c16a92aa275ce2a8ac3bd2f4a643f9112766cc1eaff')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
