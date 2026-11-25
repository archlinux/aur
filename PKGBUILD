# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=simplekvm-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Share one monitor, keyboard and mouse across multiple computers"
arch=('x86_64' 'aarch64')
url="https://github.com/fiddyschmitt/SimpleKVM"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/simplekvm-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/simplekvm-linux-arm64.tar.gz")
sha256sums_x86_64=('795b2650e7c4f2559f1cc6d08d5bb0b19a648535454ea02a763be4267f26a5b1')
sha256sums_aarch64=('19a48e3b27ee11c28ad1a2aa66cbd60eeec3f25319fa778e8e4b5b53ec466d8e')

package() {
  install -Dm755 "simplekvm/simplekvm" "${pkgdir}/usr/bin/simplekvm"
  install -Dm644 "simplekvm/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
