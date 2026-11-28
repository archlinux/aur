# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=simple-proxy-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Simple self-contained HTTP and HTTPS proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/jthomperoo/simple-proxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/simple-proxy_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/simple-proxy_linux_arm64.zip")
sha256sums_x86_64=('f526e3285694e0285b8c1415b19009a6c907ef79be1bafc55b361993e3f77615')
sha256sums_aarch64=('440eb6fd6b5d63796c296860b35584fce6f32a7f08349ef6f1d2b499760f38d1')

package() {
  install -Dm755 "simple-proxy" "${pkgdir}/usr/bin/simple-proxy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
