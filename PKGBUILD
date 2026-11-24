# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tui-test-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Control, record and test TUI apps in real terminals"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/tui-test"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/microsoft/tui-test/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tui-test-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tui-test-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')
sha256sums_x86_64=('ae1f32afb34c713284b0637ea41d855124fe0ac298defb38a4018cd952c158ca')
sha256sums_aarch64=('99588dd2e296f9b2685d7fb71d68a3dde3b1fed8c0e8f1af4d215538e858bd09')

package() {
  install -Dm755 "tui-test" "${pkgdir}/usr/bin/tui-test"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
