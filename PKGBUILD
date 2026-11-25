# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=discrawl-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Discord command-line client with a SQLite backend"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/discrawl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/discrawl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/discrawl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0ec98448c820519e1230d0a6ea7039a12b4bb781848d8b6f6e469e4126627902')
sha256sums_aarch64=('78d70b437778f5f8f612bf81cc2c427fbab381db9b80a6313e85f43e54595212')

package() {
  install -Dm755 "./discrawl" "${pkgdir}/usr/bin/discrawl"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
