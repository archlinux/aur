# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skvm-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Language virtual machine for agent skills"
arch=('x86_64' 'aarch64')
url="https://github.com/SJTU-IPADS/SkVM"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/skvm-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/skvm-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('ece00411e5196258794c36364bb4fe4c18b6e3cef00280a78034a5f03b665855')
sha256sums_aarch64=('b69dbf0082c527bd75e1672db18cfbbd97aba659c6aa4f17749f9ad303c067ee')

package() {
  install -Dm755 "./bin/skvm" "${pkgdir}/usr/bin/skvm"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
