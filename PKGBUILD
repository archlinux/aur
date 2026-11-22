# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slurmer-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A TUI for monitoring and managing SLURM jobs"
arch=('x86_64')
url="https://github.com/wjwei-handsome/Slurmer"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/wjwei-handsome/Slurmer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slurmer-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('65604d4fd90dde5618857ce6f3c1a8df196f562ee3579ff2d16ea8566a85631e')
sha256sums_x86_64=('58825682814138dfad50db487b013bf2f59493a597764aabb57cd19b89ee2e2c')

package() {
  install -Dm755 "slurmer" "${pkgdir}/usr/bin/slurmer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
