# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=conveyor-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Local CI/CD pipelines with a real-time TUI"
arch=('x86_64')
url="https://github.com/sumant1122/conveyor"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sumant1122/conveyor/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/conveyor-linux-x86_64.tar.gz")
sha256sums=('572ca8dd67a969ba171c89979adeb309eb4905d786ea9fc347bddda70456b933')
sha256sums_x86_64=('3701d3a9a9285ffc973639a403236026dacc00666d4eeabccdf9cc902554d719')

package() {
  install -Dm755 "conveyor" "${pkgdir}/usr/bin/conveyor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
