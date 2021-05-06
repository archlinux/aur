# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=i3-volume
pkgver=3.6.1
pkgrel=1
pkgdesc="Volume control and volume notifications for i3wm"
arch=(any)
url="https://github.com/hastinbe/i3-volume"
license=('GPL')
depends=('notification-daemon')
optdepends=('alsa-utils: Support for ALSA' 'pulseaudio: Support for Pulseaudio')
install=${pkgname}.install
source=("https://github.com/hastinbe/${pkgname}/archive/v${pkgver}.tar.gz"
        "i3volume-alsa.conf"
        "i3volume-pulseaudio.conf")
md5sums=('a99405b02db9141dd9da8fc6fa4e74f2'
         'ebb255f91630209a64491bb0fed9bc08'
         'c36135349c39cdd70d20242a673d0b21')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 volume "${pkgdir}/usr/bin/i3-volume"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/i3-volume/README.md"
  install -Dm644 "${srcdir}/i3volume-alsa.conf" "${pkgdir}/usr/share/doc/i3-volume/i3volume-alsa.conf"
  install -Dm644 "${srcdir}/i3volume-pulseaudio.conf" "${pkgdir}/usr/share/doc/i3-volume/i3volume-pulseaudio.conf"
}

# vim:set ts=2 sw=2 et:
