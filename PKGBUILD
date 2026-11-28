# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=etcd-walker-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="TUI tool for browsing etcd"
arch=('x86_64')
url="https://github.com/nexusriot/etcd-walker"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nexusriot/etcd-walker/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/etcd-walker-${pkgver}-linux-amd64")
sha256sums=('7aa6c2f07f1198b208c321b6c8a466b72c315ebdedf88314424feee1fe9f9bfd')
sha256sums_x86_64=('deece68274c33dfcc813e1b22c8b33d40c6c5fc8d2848d80fdfc42fa005797a2')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/etcd-walker"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
