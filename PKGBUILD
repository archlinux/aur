pkgname=gloop-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Fast and light file manager for Wayland'
arch=('x86_64')
url='https://github.com/obselate/gloop'
license=('MIT' 'Apache-2.0' 'Zlib' 'LicenseRef-HarfBuzz' 'LicenseRef-Public-Domain' 'LicenseRef-Wayland-protocols')
depends=('glibc>=2.39' 'wayland' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver' 'xdg-utils' 'shared-mime-info')
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
  'e4299fbf24e052c3eaf5d70fdabec2edee7c96c2e2913407d9294aae7320e6ad'
  '8f743b0cda834e7936dbc235354d461e15921c92632edb31b09adc0c368435e9'
  'cb572dc68bba6372b19cfa04a1810e6f89e5fb36b24fc1e22eaa601a6638f032'
  'ebbfd210cb048be0d4f2b5af60cf409b59e880517b75fa5c7913598828ca2683'
  '63ced741c827dd8fb3f11a53550cac0f4cd04daa1f4f8f182252b8ddf7eed0ff'
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
