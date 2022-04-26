# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-addon-kodi-karaoke
_pkgname=kodikaraoke
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial Kodi Karaoke addon"
arch=('any')
url='https://github.com/mrfixit2001/plugin.video.kodikaraoke'
license=('GPL')
depends=('kodi>19.0')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mrfixit2001/plugin.video.kodikaraoke/archive/refs/tags/1.0.0.tar.gz"
)
sha256sums=('75e3ffa927eb0eb92524d792a20ec0734fb42b82305ce36f5d19449225eef502')

package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  cp -a "$srcdir/plugin.video.kodikaraoke-$pkgver" "$pkgdir/usr/share/kodi/addons/$_pkgname"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/.gitignore"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/README.md"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
