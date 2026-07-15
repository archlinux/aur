# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=localsend-nautilus-extension
pkgver=1.0.0
filename="${pkgname}_${pkgver}.deb"
pkgrel=1
pkgdesc='A simple Nautilus extension that adds a "Send with LocalSend" context menu item to easily share files using LocalSend.'
arch=('x86_64')
url="https://github.com/damiansan239/localsend-nautilus-extension"
license=('MIT') # Change as needed
depends=()         # List dependencies
source=("$filename::$url/releases/download/v${pkgver}/nautilus-localsend-extension_1.0-1_all.deb")
sha256sums=('c648b3afd4943884b0a2aa5b1e32188d346a72df5fb430e584384886bbc20e4a')
install=${pkgname}.install

package() {
  bsdtar -xOf "$srcdir/$filename" --include="data.tar*" | bsdtar -C "$pkgdir" -xv --no-same-owner
}
