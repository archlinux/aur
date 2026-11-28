# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=score-compose-bin
pkgver=0.50.0
pkgrel=1
pkgdesc="Reference Score implementation for Docker Compose"
arch=('x86_64' 'aarch64')
url="https://github.com/score-spec/score-compose"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/score-compose_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/score-compose_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7257a7eed0079f92382668ff3ea4abc3158d93bce4b5b2f40b1476d84d313564')
sha256sums_aarch64=('5c999033dec805d53cd1179f5516499e1fd90af951096a17270d9d1edfec2fe0')

package() {
  install -Dm755 "score-compose" "${pkgdir}/usr/bin/score-compose"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
