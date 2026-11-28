# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gobuildcache-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Remote build cache for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/richardartoul/gobuildcache"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gobuildcache_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gobuildcache_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0cca312c4d0ae45218f40523db180bb607f887d08e4c39849350e6447b63cd8d')
sha256sums_aarch64=('541ed39df20867d21740238e7962b2e4f366cee5b0b37d4e217eeb35050b66c9')

package() {
  install -Dm755 "gobuildcache" "${pkgdir}/usr/bin/gobuildcache"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
