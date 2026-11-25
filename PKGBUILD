# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-view-allocations-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="kubectl plugin to list resource allocations and utilization"
arch=('x86_64' 'aarch64')
url="https://github.com/davidB/kubectl-view-allocations"
license=('CC0-1.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-view-allocations_${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-view-allocations_${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('95e977b4c61eb9a22da1544c0e42a70085ad1377399ad578fa65dd06916dbcfd')
sha256sums_aarch64=('557f7118d7e34fe966a9935b0bec20b3beeb012b3839e0bbe965debda88aab45')

package() {
  install -Dm755 "kubectl-view-allocations" "${pkgdir}/usr/bin/kubectl-view-allocations"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
