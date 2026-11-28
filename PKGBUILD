# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=raftkeeper-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="High-performance distributed consensus service"
arch=('x86_64')
url="https://github.com/JDRaftKeeper/RaftKeeper"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/JDRaftKeeper/RaftKeeper/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/RaftKeeper-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('db1e849c471b738d4ea01e8357e94fa162cc0377d8763bc28a0c3bc0c23cea45')
sha256sums_x86_64=('4b59242248c97df00812edc1a2f90d04fa48d6e86022456a86f886f0b83ffe50')

package() {
  install -Dm755 "RaftKeeper/lib/raftkeeper" "${pkgdir}/usr/bin/raftkeeper"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
