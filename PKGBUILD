# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='dcb-bin'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Build and run development containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/devcontainer-builder'
license=('MIT')
provides=('dcb')
conflicts=('dcb')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.1.0/dcb_0.1.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.1.0/dcb_0.1.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('4ecec7b8a7ce8cd51e11bfb5ac6f04f2ec6df4632a09a35b53928edeb1dd49d9')
sha256sums_aarch64=('ccafca00014a8d6e8986648445eccdac5494a3b3c08b76aac26d6dd0b24320b9')

package() {
  install -Dm755 "${srcdir}/dcb" "${pkgdir}/usr/bin/dcb"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/dcb/README.md"
}
