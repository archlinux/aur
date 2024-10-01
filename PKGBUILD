# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=gnome-shell-extension-quick-settings-audio-panel
pkgver=64
pkgrel=1
pkgdesc='Quick Settings Audio Panel GNOME Extension'
arch=('any')
url=https://github.com/Rayzeq/quick-settings-audio-panel
license=('GPL3')
_uuid=quick-settings-audio-panel@rayzeq.github.io
source=("$pkgname-v$pkgver.zip::$url/releases/download/v$pkgver/$_uuid.shell-extension.zip")
sha256sums=('73a856ddb8ab9465541c3d72dac21c8672c07028ddb4e2799d31f481a4f4ff41')
depends=('gnome-shell')

package() {
  local extdir=$pkgdir/usr/share/gnome-shell/extensions/$_uuid

  install -d $extdir
  bsdtar -xf $pkgname-v$pkgver.zip -C $extdir
  glib-compile-schemas $extdir/schemas

  find $extdir -type f -exec chmod 644 {} +
  find $extdir -type d -exec chmod 755 {} +
}
