# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=1.5.5
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
  '161c864fce65009234c5950358b4869fbb0899d931d03e394431a9fe5027c00281705713c6fb0e33cd30f6d37687538e53167f6c3d116ee1749cff7cff8b5147'
  '14ad6e6ec3f28e9bdaa393fe43e49ed642f963b4358a4b6cf380b59a4a1adaf2fef5bcd4cf752dd6bddb54341bef74d749073070c070280bf6529eff75d45181'
  '66891568bc58d3788fb025afffb5088c5b84a73cc50ad109705c1fda5251b6b820763486c833bfb7aeccf7f7ec0b0939330c7565819ae78701d4d9f04fc56e47'
)

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 Upscayl-${pkgver}.AppImage "$pkgdir/usr/bin/$_pkgname"
}
