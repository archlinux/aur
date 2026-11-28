# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mailtrap-local-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Local email sandbox and catcher with SMTP, web UI and JSON API"
arch=('x86_64' 'aarch64')
url="https://github.com/mailtrap/mailtrap-local"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mailtrap-local_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mailtrap-local_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b01e5d915b6e4a53a469dbba3f1fd53b88b56c002c20efe011686b16e86fff9d')
sha256sums_aarch64=('9e089ff04d089b359e4ea6d116665d67a6b469a46beefeddcb190a5bc48ad2a2')

package() {
  install -Dm755 "mailtrap-local" "${pkgdir}/usr/bin/mailtrap-local"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
