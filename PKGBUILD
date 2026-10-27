# Maintainer: NetExperts <support@netexperts.com.au>
pkgname=netexperts-mail-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='NetExperts Mail desktop application with current hosted interface'
arch=('x86_64')
url='https://netexperts.com.au'
license=('custom' 'MIT' 'BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libcups' 'libdrm' 'mesa' 'libxkbcommon' 'at-spi2-core' 'xdg-utils')
provides=('netexperts-mail')
conflicts=('netexperts-mail')
options=('!strip' '!debug')
source=('https://netexperts.com.au/downloads/NetExperts-Mail-1.0.0-linux-x64.tar.gz' 'netexperts-mail.desktop' 'netexperts-mail.png')
sha256sums=('97e540cd6a393d3b86f8c3538856b27b135ee7fd68acc5d4d63aaa6cac5e849f' '6816e722964e80023e44b492b60c9437647a50c1e0d4556c94c3e772a28d9af8' 'f6bfd24c64d39ce831b192a6a08664dfd1a830010eb797ce67d815687cde5295')
package() {
 install -dm755 "$pkgdir/opt/netexperts-mail" "$pkgdir/usr/bin"
 cp -a "$srcdir/netexperts-mail/." "$pkgdir/opt/netexperts-mail/"
 chmod 4755 "$pkgdir/opt/netexperts-mail/chrome-sandbox"
 ln -s /opt/netexperts-mail/netexperts-mail "$pkgdir/usr/bin/netexperts-mail"
 install -Dm644 "$srcdir/netexperts-mail.desktop" "$pkgdir/usr/share/applications/netexperts-mail.desktop"
 install -Dm644 "$srcdir/netexperts-mail.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/netexperts-mail.png"
 install -Dm644 "$srcdir/netexperts-mail/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}
