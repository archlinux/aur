# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname=yubikey-oath-dmenu
pkgver=0.13.0
pkgrel=2
pkgdesc="dmenu interface for getting OATH codes from a YubiKey"
url="https://github.com/emlun/yubikey-oath-dmenu"
license=('GPL3')
arch=('any')
depends=('dmenu' 'python' 'python-click' 'yubikey-manager>=4.0.0')
optdepends=(
  'libnotify: Use --notify for user feedback via notifications'
  'pinentry: YubiKey OATH password support'
  'wl-clipboard: Use --clipboard to copy code to clipboard (Wayland)'
  'wtype: Use --type to type code into focused window (Wayland)'
  'xclip: Use --clipboard to copy code to clipboard (X11)'
  'xdotool: Use --type to type code into focused window (X11)'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/emlun/${pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/emlun/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
)
validpgpkeys=('EB8627616EC1971DF076F2FF2BF5FD22FCABDE73')
sha256sums=('f2b8b75547d56b3385c36978048d36547c09e988c157d9672ed6cee2c7e386d9'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 sts=2 et
