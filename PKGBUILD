# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=kodi-addon-rumble
_pkgname=plugin.video.rumble
pkgver=1.2.2
pkgrel=1
pkgdesc="Rumble plugin for Kodi"
arch=('any')
url='https://github.com/azzy9/plugin.video.rumble'
license=('GPL2')
depends=('kodi>19.0')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/azzy9/plugin.video.rumble/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('e0a64f5655b02ff76157ef1779ae172628f600eeaa403f661e35fa4551ca3f7f')

package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  cp -a "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/share/kodi/addons/$_pkgname"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/.gitignore"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/README.md"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/LICENSE"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
