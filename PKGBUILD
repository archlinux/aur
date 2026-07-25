# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=jellyfin2samsung-bin
pkgver=2.7.0
filename="${pkgname}_${pkgver}.deb"
pkgrel=1
pkgdesc="One-click app installer for Samsung TVs, projectors and smart monitors (Tizen) — Jellyfin, Moonlight, and the whole community catalog."
arch=('x86_64')
url="https://apps2samsung.madebypatrick.nl/"
license=('MIT') # Change as needed
depends=()         # List dependencies
source=("$filename::https://github.com/Apps2Samsung/Apps2Samsung/releases/download/v${pkgver}/Apps2Samsung-v${pkgver}-linux-x64.deb")
sha256sums=('344fce86cbd1a9a10b75df47f6b7ea9a8ffdca9a4dae0fe5df6e82f16908e4d1')
options=('!strip' '!debug')

package() {
  bsdtar -xOf "$srcdir/$filename" --include="data.tar*" | bsdtar -C "$pkgdir" -xv --no-same-owner
}
