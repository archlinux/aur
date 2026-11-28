# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ecsk-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="Interactively run tasks, exec commands, copy files and view logs on Amazon ECS"
arch=('x86_64' 'aarch64')
url="https://github.com/yukiarrr/ecsk"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ecsk_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ecsk_Linux_arm64.tar.gz")
sha256sums_x86_64=('caa9de1640d7741c27681a2098b9fe192d362b2170de477428ba3a36b2cf15d0')
sha256sums_aarch64=('c046a336eda308077b4667c49abc8a8dd7c5ec9a3edad0f3514f8993b509c937')

package() {
  install -Dm755 "ecsk" "${pkgdir}/usr/bin/ecsk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
