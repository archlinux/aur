# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fake-gcs-server"
pkgname="${_pkgname}-bin"
pkgver=1.52.2
pkgrel=1
pkgdesc="Google Cloud Storage emulator & testing library"
arch=('aarch64' 'x86_64')
url="https://github.com/fsouza/${_pkgname}"
license=('BSD-2-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
sha256sums_aarch64=('dae42a5aeab9c5bd433c6e861d4c80ec2d349f88eef3e6ab7b16df21989dda1b')
sha256sums_x86_64=('de4cd1205e2a09ffb17272294714aaf994779e43f7e510d158b1d60a31269337')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
