pkgname=gloop-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Fast and light file manager for Wayland'
arch=('x86_64')
url='https://github.com/obselate/gloop'
license=('MIT' 'Apache-2.0' 'Zlib' 'LicenseRef-HarfBuzz' 'LicenseRef-Public-Domain' 'LicenseRef-Wayland-protocols')
depends=('glibc>=2.38' 'wayland' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver' 'xdg-utils' 'shared-mime-info')
optdepends=('xdg-desktop-portal>=1.18: use Gloop for portal file choosers')
provides=("gloop=$pkgver")
conflicts=('gloop')
options=('!strip' '!debug')
source=(
  "gloop-$pkgver-linux-x64.tar.gz::$url/releases/download/v$pkgver/gloop-linux-x64.tar.gz"
  "gloop-$pkgver.png::https://raw.githubusercontent.com/obselate/gloop/v$pkgver/assets/gloop.png"
  "gloop-$pkgver.metainfo.xml::https://raw.githubusercontent.com/obselate/gloop/v$pkgver/assets/io.github.obselate.gloop.metainfo.xml"
  "gloop-$pkgver.LICENSE::https://raw.githubusercontent.com/obselate/gloop/v$pkgver/LICENSE"
  "gloop-$pkgver.ThirdPartyNotices.txt::https://raw.githubusercontent.com/obselate/gloop/v$pkgver/src/Resources/ThirdPartyNotices.txt"
  'io.github.obselate.gloop.desktop'
  'org.freedesktop.impl.portal.desktop.gloop.service'
  'gloop.portal'
)
sha256sums=(
  '7e0460081e9b461d1166e65a1f7ab27b9c9522354ba66aca538abc6f49934fc4'
  '8f743b0cda834e7936dbc235354d461e15921c92632edb31b09adc0c368435e9'
  '7e04cbf87fae594bee3d38e2c568e88045b12d5650b0a6577a228457c4aafefc'
  'ebbfd210cb048be0d4f2b5af60cf409b59e880517b75fa5c7913598828ca2683'
  '17dd25377f292b55ceebebfeb77b64d9176bc174ebaf15a776dfc103f989f890'
  '10d41a03b0e51ffc439ff43817679f9040aad84caa096e8fc62cd5b12bc0b2eb'
  '16b036ee7897168e90c85d2b2f0b66ef043121b6d5d0d01dca70db500047b8c4'
  'a2eebb7523439c238995cbc8b5fff19e89b245cdce846dbf667788912af41843'
)

package() {
  install -Dm755 gloop "$pkgdir/usr/bin/gloop"
  install -Dm644 io.github.obselate.gloop.desktop "$pkgdir/usr/share/applications/io.github.obselate.gloop.desktop"
  install -Dm644 "gloop-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.obselate.gloop.png"
  install -Dm644 "gloop-$pkgver.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.obselate.gloop.metainfo.xml"
  install -Dm644 org.freedesktop.impl.portal.desktop.gloop.service "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.gloop.service"
  install -Dm644 gloop.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/gloop.portal"
  install -Dm644 "gloop-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "gloop-$pkgver.ThirdPartyNotices.txt" "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyNotices.txt"
}
