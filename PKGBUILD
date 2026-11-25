# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=freno-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Cooperative, highly available throttler service"
arch=('x86_64')
url="https://github.com/github/freno"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/freno_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('f13be1a16400772990b8645ab3274fe1e980a7f05e1a35299d9590c245c08a90')

package() {
  install -Dm755 "freno" "${pkgdir}/usr/bin/freno"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
