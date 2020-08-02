# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname=yubikey-oath-dmenu
pkgver=0.10.0
pkgrel=1
pkgdesc="dmenu interface for getting OATH codes from a YubiKey"
url="https://github.com/emlun/yubikey-oath-dmenu"
license=('GPL3')
arch=('any')
depends=('dmenu' 'python' 'python-click' 'xclip' 'yubikey-manager>=0.5.0')
optdepends=(
  'libnotify: Feedback via notify-send'
  'xdotool: Type code instead of copying to clipboard'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/emlun/${pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/emlun/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
)
validpgpkeys=('EB8627616EC1971DF076F2FF2BF5FD22FCABDE73')
sha256sums=('d0d73a2f0339c83220c089386fb774c0b70129a6e423e8a50776a993136fa9b7'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 sts=2 et
