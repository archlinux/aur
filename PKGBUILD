# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sprout-tui-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A terminal habit tracker with GitHub-style activity heatmap, streak tracking and goal management"
arch=('x86_64' 'aarch64')
url="https://github.com/kb019/sprout"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kb019/sprout/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sprout-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sprout-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('1126322e2cc8d165adc4c792eeb195717de2bcc7b39be1ce77959d78e87ef685')
sha256sums_x86_64=('105e225b3319faa19fa6147bc011e9dd06d6fe8bfa12ae2267cb4ee99b4a58d8')
sha256sums_aarch64=('9e2d45d8e9b06c7858a85b2cb06fd56febb016ae4921c64eccdac6fe19ab1a33')

package() {
  install -Dm755 "sprout" "${pkgdir}/usr/bin/sprout"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
