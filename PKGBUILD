# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=snolc-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Modular userspace proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/owenewans/snolc"
license=('Unlicense')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/snolc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/snolc-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4f1348df00e6d41efb2660a4ea249b887aa218c894c57069df28babeab438ccc')
sha256sums_aarch64=('13374354416a43fcc68b26c6532a841ab1c2c822d311d6827f594ffbd2d93395')

package() {
  install -Dm755 "bin/snolc" "${pkgdir}/usr/bin/snolc"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
