# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=b4n-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A terminal-based tool for browsing Kubernetes resources"
arch=('x86_64' 'aarch64')
url="https://github.com/fioletoven/b4n"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/b4n-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/b4n-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('0f800cd4f7a51ce27e38a440cab5037f92712fc88e8a5d9495e001820f7a51fe')
sha256sums_aarch64=('feb6081678e3c148f0a6648ab73b6b3c98b9e4f636fa48731a49c638873a06fa')

package() {
  install -Dm755 "b4n" "${pkgdir}/usr/bin/b4n"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
