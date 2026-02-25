pkgname=ssmt4-linux
pkgver=0.0.6_beta
pkgrel=1
pkgdesc="SSMT4 - Super Simple Linux Game Tools 4th"
arch=('x86_64')
url='https://github.com/xiaobai01111/SSMT4-Linux'
license=('GPL-3.0-or-later')
provides=('ssmt4')
conflicts=('ssmt4' 'ssmt4-git')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'xdg-utils')
optdepends=(
  'xorg-xwayland: XWayland support'
  'wine: Windows game compatibility'
  'winetricks: Wine helper scripts'
  'libayatana-appindicator: tray icon support'
)
options=('!debug')

_upstream_ver="${pkgver//_/-}"
source=(
  "ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/xiaobai01111/SSMT4-Linux/releases/download/v${_upstream_ver}/ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums=('2a82860eb924a463f560f5e201dc407604ea9ce29eaa82c966240992dad59686')

package() {
  bsdtar -xpf "${srcdir}/ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
}
