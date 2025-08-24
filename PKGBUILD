# Maintainer: Sofia Talarmo <sofia@teascade.net>
pkgname=pipeswitchd-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Daemon for PipeWire that automatically links audio inputs and outputs based on regular expressions, similar to patchbay."
arch=('x86_64')
url="https://github.com/Teascade/pipeswitch/"
license=('GPL3')
depends=('pipewire')
provides=("pipeswitchd=${pkgver}")
conflicts=("pipeswitchd")
source=("${url}/releases/download/v${pkgver}/pipeswitchd.zip")
sha512sums=('9d8b2c3134f59022afe4fca3785dae32237e25adb1ae49180112a69c0524e8528ca8312ac0ad1d789e83d27a2f5732e4d1e54cf3ea91d7f4ff9a40e045870a88')

package() {
  install -Dm755 "${srcdir}/pipeswitchd" "${pkgdir}/usr/bin/pipeswitchd"
  install -Dm755 "${srcdir}/pipeswitchd.service" "${pkgdir}/usr/lib/systemd/user/pipeswitchd.service"
}