# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=datatui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal UI for exploring data"
arch=('x86_64')
url="https://github.com/forensicmatt/datatui"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/datatui-v${pkgver}-Linux-X64.tar.gz")
sha256sums_x86_64=('5de42998b2efd143b4cdcdbbfd26cf123a01bbddf28f993fb47a3a602d89f4bc')

package() {
  install -Dm755 "./datatui" "${pkgdir}/usr/bin/datatui"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
