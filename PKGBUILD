# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=signal-monochrome-tray
pkgdesc="changes the tray icon of Signal to monochrome"
pkgver=0.1
pkgrel=1
arch=('x86_64')
license=(
    'GPL-3.0-or-later'
)
depends=(
    'asar'
    'imagemagick'
    'papirus-icon-theme'
    'signal-desktop'
)
source=(
    signal-tray{,.hook}
)
sha256sums=('0335f16c7ad7603993584a4e1f6809af89b65731daf80faa934209d8c91e7ca8'
            '7ef7234482f4ffbd8f775e0f82597bf161267328667cfd55e02e2b5499aecabd')

package() {
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" signal-tray.hook
  install -Dt "$pkgdir/usr/share/libalpm/scripts/" signal-tray
}
