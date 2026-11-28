# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arbor-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Graph-native code intelligence for deterministic program understanding"
arch=('x86_64' 'aarch64')
url="https://github.com/Anandb71/arbor"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Anandb71/arbor/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/arbor-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/arbor-linux-aarch64.tar.gz")
sha256sums=('d51baea86e079c590455b4b94d9365b7c0953d954bcc388ce8b17f8d6a485143')
sha256sums_x86_64=('e276b078e8adb7e29c5c84234771d0e7dda2169b74aa76c23089f4ffd7718691')
sha256sums_aarch64=('4ee667adfb4e80628f1c35ebacad2ef2522c07dd00796ce56acffc7c59e19311')

package() {
  install -Dm755 "arbor" "${pkgdir}/usr/bin/arbor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
