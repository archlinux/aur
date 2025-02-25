# Maintainer: asm0dey <me@asm0dey.site>
pkgname=zns-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI tool for querying DNS records with readable, colored output."
arch=('x86_64' 'aarch64' 'i686')
_arch=""
if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
elif [ "$CARCH" == "i686" ]; then
    _arch="386"
else
    _arch="arm64"
fi
    
url="https://github.com/znscli/zns"
license=('MIT')
source=("znc-$pkgver.tar.gz::$url/releases/download/v$pkgver/zns_${pkgver}_linux_$_arch.tar.gz")
sha256sums=('71421cef2d732d731c25d2eb077df1ebe87e5f8c706c1e8fa2a545791aa6056d')
provides=("zns")

package() {
    install -dm 755 $pkgdir/usr/bin
    install -m 755 "$srcdir/zns" $pkgdir/usr/bin/zns
    install -dm 755 $pkgdir/usr/share/licenses/zns-bin/
    install -m 644 "$srcdir/LICENSE" $pkgdir/usr/share/licenses/zns-bin/
}
