# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=keybr-tui-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Adaptive touch-typing practice that finds the keys slowing you down and drills them"
arch=('x86_64')
url="https://github.com/y0sif/keybr-tui"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/keybr-tui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c43f8028332da1ebcc1ec7e4e925898d0acc716ccfd59e85de4227dbba37b26c')

package() {
  install -Dm755 "keybr-tui" "${pkgdir}/usr/bin/keybr-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
