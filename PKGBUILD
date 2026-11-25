# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nginx-ignition-bin
pkgver=2.51.1
pkgrel=1
pkgdesc="An user interface for the nginx web server, aimed at developers and enthusiasts that don't want to manage configuration files manually"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasdillmann/nginx-ignition"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/nginx-ignition-${pkgver}.linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/nginx-ignition-${pkgver}.linux-arm64.zip")
sha256sums_x86_64=('40786939cf11a54d0a20f939ab5a611babd8341291549c2602f2a6dc39652b54')
sha256sums_aarch64=('644ad30c6d056a71fc229e76d5456349ff2c54e9dc120147d477bd539a2c7161')

package() {
  install -Dm755 "nginx-ignition" "${pkgdir}/usr/bin/nginx-ignition"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
