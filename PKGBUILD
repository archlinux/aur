# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sortie-bin
pkgver=1.32.0
pkgrel=1
pkgdesc="Turn tracker tickets into autonomous agent sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/sortie-ai/sortie"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sortie_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sortie_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4cf8bef41caa9ed5391abdefad1720457666ffdc43fc6321b8771066561ad820')
sha256sums_aarch64=('de5d8d727cf48cb306d73dd812dd0b46e244271196611371e7061d38af8040cd')

package() {
  install -Dm755 "sortie" "${pkgdir}/usr/bin/sortie"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
