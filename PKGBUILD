# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=jellyfin2samsung-bin
pkgver=2.2.0.8
filename="${pkgname}_${pkgver}.deb"
pkgrel=1
pkgdesc="One-click install of Jellyfin on your Samsung TV — fully compatible with all Tizen versions!"
arch=('x86_64')
url="https://jellyfin2samsung.madebypatrick.nl/"
license=('MIT') # Change as needed
depends=()         # List dependencies
source=("$filename::https://github.com/Jellyfin2Samsung/Samsung-Jellyfin-Installer/releases/download/v${pkgver}/Jellyfin2Samsung-v${pkgver}-linux-x64.deb")
sha256sums=('5f24d9c978bea12d9176e89698e31ade2926accb0a089a4eebef918ccc4dfad7') # Replace with actual checksum or use 'SKIP' for testing
options=('!strip' '!debug')

package() {
  bsdtar -xOf "$srcdir/$filename" --include="data.tar*" | bsdtar -C "$pkgdir" -xv --no-same-owner
}
