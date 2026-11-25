# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=isolated-vm-bin
pkgver=6.0.2
pkgrel=1
pkgdesc="Secure & isolated JS environments for nodejs"
arch=('x86_64' 'aarch64')
url="https://github.com/laverdet/isolated-vm"
license=('ISC')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/laverdet/isolated-vm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/isolated-vm-v${pkgver}-node-v127-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/isolated-vm-v${pkgver}-node-v127-linux-arm64.tar.gz")
sha256sums=('f3e00694c6334a2f6b4e22deb8367e8934e92bdc589365f3cab5fa02905f81a5')
sha256sums_x86_64=('9235d79be676b432d78f258e3a6d516222464c7c90a2ae78e22a71d90bbefd17')
sha256sums_aarch64=('60b04e39e70dcf14223df0de7d96d23c5142a8feda444a12eb8dde3aa047871b')

package() {
  install -Dm755 "out/isolated_vm.node" "${pkgdir}/usr/bin/isolated_vm.node"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
