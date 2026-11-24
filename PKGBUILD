# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hacksguard-bin
pkgver=0.3
pkgrel=1
pkgdesc="Multi-threaded TUI malware analysis tool"
arch=('x86_64')
url="https://github.com/rhacknarok/hacksguard"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rhacknarok/hacksguard/${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/x86_64-unknown-linux-gnu-hacksguard")
sha256sums=('ecabd58850d5823b34f390f2fb2d52496376c8d302f646b8eff85271329c73c4')
sha256sums_x86_64=('ac91f1fb8dbd952b15d4b4bbfab5cc6636293394ad70adf43461aa1c48073006')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/x86_64-unknown"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
