# Maintainer: Sebastian Arrieta <sarrietav.dev@gmail.com>
#
# Prebuilt sift, for people who would rather not install Qt's development
# packages and compile. The tarball is made by bin/package and attached to the
# GitHub release; nothing is built here. sift-reader is the package that builds
# from source.
pkgname=sift-reader-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Read the web, aloud, with Kokoro (prebuilt)'
arch=('x86_64')
url='https://github.com/sarrietav-dev/sift'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-webengine' 'qt6-wayland')
provides=('sift-reader')
conflicts=('sift' 'sift-bin' 'sift-git' 'sift-reader')
options=('!debug' '!strip')
source=("sift-${pkgver}-${CARCH}.tar.zst::${url}/releases/download/v${pkgver}/sift-${pkgver}-${CARCH}.tar.zst")
sha256sums=('547deb4d38dfed8e1a740684c590e3bd11896bdb030d7d8451babd0e571797ad')

package() {
  cd "sift-${pkgver}-${CARCH}"
  install -Dm755 sift "$pkgdir/usr/bin/sift"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES/defuddle.txt "$pkgdir/usr/share/licenses/$pkgname/defuddle.txt"
  install -Dm644 sift.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sift.svg"
  install -Dm644 sift.desktop "$pkgdir/usr/share/applications/sift.desktop"
}
