# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zentinel-bin
pkgver=26.11_11
pkgrel=1
pkgdesc="Security-first reverse proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/zentinelproxy/zentinel"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zentinelproxy/zentinel/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zentinel-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zentinel-${pkgver}-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('63a18e1a0fd1530cbf99bd22468d963c0e8e078423b7c98d5e85bbb2a32074b4')
sha256sums_aarch64=('121ebf8f0241724aaa867988b6425d5c3eb33f602e96c9199c8b1e3c8df7c2cd')

package() {
  install -Dm755 "./zentinel" "${pkgdir}/usr/bin/zentinel"
  install -Dm755 "./zentinel-echo-agent" "${pkgdir}/usr/bin/zentinel-echo-agent"
  install -Dm755 "./zentinel-gateway" "${pkgdir}/usr/bin/zentinel-gateway"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
