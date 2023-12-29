# Maintainer: HackerNCoder <hackerncoder at encryptionin dot space>
# Contributor: Nguyen Pham Cao <natsukagami at gmail dot com>

pkgname=mpd-mpris-bin
pkgver=0.4.1
pkgrel=2
pkgdesc='An implementation of the MPRIS protocol for MPD.'
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url='https://github.com/natsukagami/mpd-mpris'
license=('MIT')
depends=('glibc')
provides=('mpd-mpris')
conflicts=('mpd-mpris')
source=(
    "${pkgname}.service::https://raw.githubusercontent.com/natsukagami/mpd-mpris/v${pkgver}/mpd-mpris.service")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mpd-mpris_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname}-386-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mpd-mpris_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mpd-mpris_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mpd-mpris_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mpd-mpris_${pkgver}_linux_armv7.tar.gz")
sha256sums=('e36b7de3fcb9eb53ad62944115b8e43181e34bae1b7068a428f19da5c44b6dc9')
sha256sums_x86_64=('641d64b844c0eb6f0493e764e718b6a0da40f2b2611e09f7bb490efecb08f78a')
sha256sums_i686=('cb7e352543be98afb8d6e2569b69a9b05998538e2d7e096f485b12fa985f6a82')
sha256sums_aarch64=('9cc95881bf8b857f2f44ef92ed722c27e161c67ba2814401165de6b63e873052')
sha256sums_armv6h=('1bf8d2af1c97e50ca1ef7c0b6577391146a1a806f26383d4312a2254113882f0')
sha256sums_armv7h=('eac3ed6fd1cf0dcad8c67b426ac403955da378c003d57eaa5e3ea75a2eb83a89')

package() {
  # Install binary
  install -D -m 0755 mpd-mpris "$pkgdir/usr/bin/mpd-mpris"
  # Install other files
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/mpd-mpris/LICENSE"
  install -D -m 0644 README.md "$pkgdir/usr/share/doc/mpd-mpris/README"
  install -D -m 0644 ${pkgname}.service "$pkgdir/usr/lib/systemd/user/mpd-mpris.service"
}
