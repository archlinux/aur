# Maintainer: Andreas Hirschauer <andreas@hirschauer-it.de>
pkgname=typora-latest
pkgver=0.9.60
pkgrel=1
pkgdesc="This packet provides the latest tar.gz archive of typora.io"
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
depends=('gconf' 'libxss' 'electron')
optdepends=('noto-fonts-emoji: Or some other emoji font to see emojis')
source=(
    "typora.desktop"
    "https://typora.io/linux/Typora-linux-x64.tar.gz"
)
md5sums=('c1235956cf0c66dbd26273813cd51646'
         '1d3178e10d97d59fcfd1e587c9b2ba88')

package() {
    _src="$srcdir/Typora-linux-x64"
    mkdir -p "$pkgdir/opt/typora"

	cp -r "$_src" "$pkgdir/opt/typora"

	install -Dm644 "$_src/LICENSE" "$pkgdir/opt/typora"
    install -Dm644 "$srcdir/typora.desktop" "$pkgdir/usr/share/applications/typora.desktop"
}
