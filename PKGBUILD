# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=jellyfin2samsung-bin
pkgver=2.6.0
filename="${pkgname}_${pkgver}.deb"
pkgrel=1
pkgdesc="One-click app installer for Samsung TVs, projectors and smart monitors (Tizen) — Jellyfin, Moonlight, and the whole community catalog."
arch=('x86_64')
url="https://apps2samsung.madebypatrick.nl/"
license=('MIT') # Change as needed
depends=()         # List dependencies
source=("$filename::https://github.com/Apps2Samsung/Apps2Samsung/releases/download/v${pkgver}/Apps2Samsung-v${pkgver}-linux-x64.deb")
sha256sums=('424f0d5b6fa2defa286f00b4c1eb40d7ad9a34285cb68b120c73e5e50979b3ff')
options=('!strip' '!debug')

package() {
  bsdtar -xOf "$srcdir/$filename" --include="data.tar*" | bsdtar -C "$pkgdir" -xv --no-same-owner
}
