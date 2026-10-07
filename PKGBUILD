# Maintainer: Aochi <me@aochi.uk>
pkgname=rosu-patcher-bin
pkgver=20261007.1
pkgrel=1
pkgdesc="Launcher for the RealistikOsu Patcher"
arch=('x86_64')
url="https://ussr.pl"
license=('LicenseRef-proprietary')
depends=('glibc' 'libx11' 'libice' 'libsm' 'fontconfig' 'openssl' 'zlib')
optdepends=(
  'osu-winello: run osu! stable through Wine'
  'osu-lazer-bin: run osu!lazer'
  'gst-plugins-base: intro video'
  'gst-libav: intro video codecs'
)
provides=('rosu-patcher')
conflicts=('rosu-patcher')
options=('!strip')
# The binary comes from the patcher backend, which serves whatever version is current, so this checksum has to be
# updated with every release (or pointed at a versioned GitHub release once there is one).
source=("rosu-patcher-$pkgver::https://ussr.pl/api/v1/patcher/launcher/linux/download")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/rosu-patcher-$pkgver" "$pkgdir/usr/bin/rosu-patcher"
}
