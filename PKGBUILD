# Maintainer: Sofia Talarmo <sofia@teascade.net>
pkgname=pipeswitchd-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Daemon for PipeWire that automatically links audio inputs and outputs based on regular expressions, similar to patchbay."
arch=('x86_64')
url="https://github.com/Teascade/pipeswitch/"
license=('GPL3')
depends=('pipewire')
provides=("pipeswitchd")
conflicts=("pipeswitchd")
source=("${url}/releases/download/v${pkgver}/pipeswitchd.zip")
sha512sums=('df59566a8a6ed2a744f2bde7efe85981ac807e17907a198764ea4f582a22a765d9f579be3d5b2d50a9681358c46a8163857df794d7f652afd61eda0d5a71d653')

package() {
  install -Dm755 "${srcdir}/pipeswitchd" "${pkgdir}/usr/bin/pipeswitchd"
  install -Dm755 "${srcdir}/pipeswitchd.service" "${pkgdir}/usr/lib/systemd/user/pipeswitchd.service"
}