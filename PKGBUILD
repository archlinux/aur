# Maintainer: Alexandru Spinu <spinualexandru@outlook.com>

pkgname=antigravity-appimage
_pkgname=antigravity
pkgver=2.7.1
_execution_id=5840911524036608
pkgrel=1
pkgdesc='An agentic development platform from Google, evolving the IDE into the agent-first era.(AppImage)'
arch=(x86_64 aarch64)
url='https://antigravity.google/'
license=(LicenseRef-Google-Antigravity)
depends=(bash fuse2 zlib)
provides=(antigravity antigravity-appimage-bin)
conflicts=(antigravity antigravity-appimage-bin)
options=(!strip !debug)
install=$_pkgname.install
source=(antigravity.sh
  antigravity.desktop
  antigravity-url-handler.desktop
  antigravity.appdata.xml
  antigravity-workspace.xml
  antigravity.png
  antigravity
  _antigravity
  LICENSE)
source_x86_64=("Antigravity-$pkgver-$CARCH.AppImage::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_execution_id}/linux-x64/Antigravity.AppImage")
source_aarch64=("Antigravity-$pkgver-$CARCH.AppImage::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_execution_id}/linux-arm/Antigravity.AppImage")
md5sums=('6d13547dc860f5744b2e854cff2226dc'
  '711aba6dead2c6a1e02aea448e5d864d'
  'ec7b359462946788fce916772dea4bd1'
  '42d3a4dcc64aade1a8dc9f00cad9c5e6'
  '94cb8d671743f702b598d95b88daa5c0'
  '4007bd80806a66d601049a7b425859bc'
  'd8847ea031513e6915aca4e366e8f071'
  '18aea4c258e91759abb6a0e38eab1a9b'
  '82d4a168a6801c4f87e83aabb7ea1bdf')
md5sums_x86_64=('a8e877878753ba02d90e729070249524')
md5sums_aarch64=('e1655b64f2e60cfe9247c2f25d0e5e89')

package() {
  install -Dm755 "Antigravity-$pkgver-$CARCH.AppImage" "$pkgdir/opt/$pkgname/Antigravity.AppImage"

  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $_pkgname-url-handler.desktop -t "$pkgdir/usr/share/applications"

  install -Dm644 $_pkgname.appdata.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 $_pkgname-workspace.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 $_pkgname.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 $_pkgname "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 _$_pkgname "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
