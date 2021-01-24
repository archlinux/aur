# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="gnome-shell-extension-blyr"
pkgver=8
pkgrel=1
epoch=1
pkgdesc="Apply a Blur Effect to GNOME Shell UI elements"
arch=(any)
url="https://github.com/yozoon/gnome-shell-extension-blyr"
license=(GPL)
depends=('gnome-shell>=3.34')
optdepends=('clutter-gtk: configuring blyr')
makedepends=(unzip)
source=(https://github.com/yozoon/gnome-shell-extension-blyr/releases/download/v$pkgver/blyr@yozoon.dev.gmail.com.zip)
noextract=(blyr@yozoon.dev.gmail.com.zip)
b2sums=('bed0fc8c61585248312bcbb0dcf4ae282d2c79aef58df446660060476d6e66446d52409ca9b0d7d64807ebb1ee2e046572f97d82d74fcb203f68935a27ff55ed')

prepare()
{
  install -d "gnome-shell-extension-blyr"
  unzip "blyr@yozoon.dev.gmail.com.zip" -d "gnome-shell-extension-blyr"
}

package()
{
  local _uuid="blyr@yozoon.dev.gmail.com"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  cp -r "gnome-shell-extension-blyr/"* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
