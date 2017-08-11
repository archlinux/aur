# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-addon-screensaver-apple-aerial
_pkgname=screensaver.atv4
pkgver=1.4.2
pkgrel=2
pkgdesc="The Apple TV4 aerial screensaver for kodi"
arch=('any')
url='https://github.com/enen92/screensaver.atv4'
license=('GPL')
depends=('kodi')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/enen92/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('5b26750b1239d51e3d2e08ae2ab7a9944af7d4b3526dd6e5d8950a7793f254b3')
install=readme.install

package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
  cp -a "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/share/kodi/addons/$_pkgname"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/README.md"
  mv "$pkgdir/usr/share/kodi/addons/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
