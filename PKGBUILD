# Maintainer: Nguyen Pham Cao <natsukagami at gmail dot com>

pkgname=mpd-mpris-bin
pkgver=0.4.0
_pkgver=0.4.0-2
pkgrel=1
pkgdesc='An implementation of the MPRIS protocol for MPD.'
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url='https://github.com/natsukagami/mpd-mpris'
license=('MIT')
depends=('glibc')
provides=('mpd-mpris')
conflicts=('mpd-mpris')
source=(
    "${pkgname}.service::https://raw.githubusercontent.com/natsukagami/mpd-mpris/v${_pkgver}/mpd-mpris.service"
    "${pkgname}-README::https://raw.githubusercontent.com/natsukagami/mpd-mpris/v${_pkgver}/README.md")
source_x86_64=("${pkgname}-x86_64-${_pkgver}.tar.gz::${url}/releases/download/v${_pkgver}/mpd-mpris_${_pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname}-386-${_pkgver}.tar.gz::${url}/releases/download/v${_pkgver}/mpd-mpris_${_pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname}-aarch64-${_pkgver}.tar.gz::${url}/releases/download/v${_pkgver}/mpd-mpris_${_pkgver}_linux_arm64.tar.gz")
source_armv6h=("${pkgname}-armv6h-${_pkgver}.tar.gz::${url}/releases/download/v${_pkgver}/mpd-mpris_${_pkgver}_linux_armv6.tar.gz")
source_armv7h=("${pkgname}-armv7h-${_pkgver}.tar.gz::${url}/releases/download/v${_pkgver}/mpd-mpris_${_pkgver}_linux_armv7.tar.gz")
sha256sums=('e36b7de3fcb9eb53ad62944115b8e43181e34bae1b7068a428f19da5c44b6dc9'
            '6086e1dc23d3eba00b1a11e45c87f3b8495b286b921a717d8e012ee03403d89d')
sha256sums_x86_64=('451dec98e41a42aa5aa3f26e5379ba8959e85c87c5751353ec2c75e80ed29bcf')
sha256sums_i686=('5383ae1d8d88e30b43b02739378e0470332b62abaf56548e7ae37359b94f520f')
sha256sums_aarch64=('3c16418befc11352d2bd06b248bec431f4abaf2a36a59fbc9115a0199826c42f')
sha256sums_armv6h=('3205ec0e1d4af2d93f415f6a03fd1c6cf6ba3dcb95e9b4c74f090bc777d36d9b')
sha256sums_armv7h=('f7befcc7f20c55c22710707dac42f4f31cfbb0d2c0e12c4114d7424aa0b4122d')

package() {
    # Install binary
	install -D -m 0755 mpd-mpris "$pkgdir/usr/bin/mpd-mpris"
	# Install other files
	install -D -m 0644 ${pkgname}-README "$pkgdir/usr/doc/mpd-mpris/README"
	install -D -m 0644 ${pkgname}.service "$pkgdir/usr/lib/systemd/user/mpd-mpris.service"
}
