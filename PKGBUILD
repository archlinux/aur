# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=geocheck-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Check where the internet thinks you are and how directly you reach it"
arch=('x86_64' 'aarch64')
url="https://github.com/remnawave/geocheck"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/geocheck_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/geocheck_linux_arm64.tar.gz")
sha256sums_x86_64=('eca33bbee3c2c3ea7ade85f9a61ef4c7471a8334eb8f0a715e844aef865307d9')
sha256sums_aarch64=('1badce683fd901b4052a78b833d536b851cf1f5952d82bc985c875e37a153267')

package() {
  install -Dm755 "geocheck" "${pkgdir}/usr/bin/geocheck"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
