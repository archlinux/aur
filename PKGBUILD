# Maintainer: NetExperts <support@netexperts.com.au>
pkgname=my-netexperts-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='My NetExperts desktop application with current hosted interface'
arch=('x86_64')
url='https://netexperts.com.au'
license=('custom' 'MIT' 'BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libcups' 'libdrm' 'mesa' 'libxkbcommon' 'at-spi2-core' 'xdg-utils')
provides=('my-netexperts')
conflicts=('my-netexperts')
options=('!strip' '!debug')
source=('https://netexperts.com.au/downloads/My-NetExperts-1.0.0-linux-x64.tar.gz' 'my-netexperts.desktop' 'my-netexperts.png')
sha256sums=('772bd88bdd4dec3a6a99afb3408a6535698e9e1f2af4b55cdb030dc285784b58' '2b733a9ae6e4954385e7914ce5cb17a7adb69ca2d7cb3b430af902d3ac6e6035' 'a9c54b6bbdd56d35cabea9be96d9e65738a9299e40ef2a922cd8e6175fb1be34')
package() {
 install -dm755 "$pkgdir/opt/my-netexperts" "$pkgdir/usr/bin"
 cp -a "$srcdir/my-netexperts/." "$pkgdir/opt/my-netexperts/"
 chmod 4755 "$pkgdir/opt/my-netexperts/chrome-sandbox"
 ln -s /opt/my-netexperts/my-netexperts "$pkgdir/usr/bin/my-netexperts"
 install -Dm644 "$srcdir/my-netexperts.desktop" "$pkgdir/usr/share/applications/my-netexperts.desktop"
 install -Dm644 "$srcdir/my-netexperts.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/my-netexperts.png"
 install -Dm644 "$srcdir/my-netexperts/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}
