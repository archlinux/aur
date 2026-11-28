# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wait4it-bin
pkgver=17.1.2
pkgrel=1
pkgdesc="Wait until a port or service is ready"
arch=('x86_64' 'aarch64')
url="https://github.com/ph4r5h4d/wait4it"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wait4it-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wait4it-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('7e8b4fd7432271b9e0af9a44c2bd387e98f6e7617d8530723d950868e5a06ea9')
sha256sums_aarch64=('748a2a4eac207acd5ba5ace2b7eec5baabc15ef568418e6be354020734c7c5da')

package() {
  install -Dm755 "wait4it" "${pkgdir}/usr/bin/wait4it"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
