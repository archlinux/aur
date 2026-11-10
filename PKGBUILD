# Maintainer: archsal <account@salvanwezel.be>
pkgname=statlocker-companion
pkgver=20261110
pkgrel=1
pkgdesc='Native Linux companion app for Statlocker and Deadlock'
arch=('x86_64')
url='https://statlocker.gg/deadlock-companion-app'
license=('unknown')
depends=('fuse2')
options=('!strip')
_appimage_url='https://updates.statlocker.gg/companion/download/statlocker-companion_amd64.AppImage'
# The upstream AppImage is the only available Linux release artifact.
source=(
  "statlocker-companion.AppImage::${_appimage_url}"
  'statlocker-companion'
  'statlocker-companion.desktop'
)
sha256sums=('06b285ce3bd28b636f0f7b27eb17ef2153ca70eb3f494f20947b1dae0cc10a50'
            '5291ee2cfd48631089ee436d142257db1387720e696e1d2abe5a5278b88256f6'
            '006f44b0c0f6e8213b6695cfc8b243f4a6e83ab78ab681fd115686c78ca0e454')

package() {
  install -Dm755 "$srcdir/statlocker-companion.AppImage" \
    "$pkgdir/usr/lib/statlocker-companion/statlocker-companion.AppImage"
  install -Dm755 "$srcdir/statlocker-companion" \
    "$pkgdir/usr/bin/statlocker-companion"
  install -Dm644 "$srcdir/statlocker-companion.desktop" \
    "$pkgdir/usr/share/applications/statlocker-companion.desktop"
}
