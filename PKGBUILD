# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('fuse2' 'zlib')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/upscayl/upscayl/releases/download/v${pkgver}/Upscayl-${pkgver}.AppImage"
  "$_pkgname.desktop"
  "$_pkgname.png"
)

sha512sums=(
  'bb7079d0dc37b8fad72ad8fcf4b7c1d9f0e2e36c594c379584de0ae252503bfd541484b4c713e219cffc2de5837e8f94064243b151f5651c3777f589734dc72a'
  '14ad6e6ec3f28e9bdaa393fe43e49ed642f963b4358a4b6cf380b59a4a1adaf2fef5bcd4cf752dd6bddb54341bef74d749073070c070280bf6529eff75d45181'
  '66891568bc58d3788fb025afffb5088c5b84a73cc50ad109705c1fda5251b6b820763486c833bfb7aeccf7f7ec0b0939330c7565819ae78701d4d9f04fc56e47'
)

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 Upscayl-${pkgver}.AppImage "$pkgdir/usr/bin/$_pkgname"
}
