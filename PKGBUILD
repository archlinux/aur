# Maintainer: James Brink <brink.james@gmail.com>
pkgname=omnisharp-roslyn-http-bin
pkgver=1.33.0
pkgrel=1
pkgdesc=".NET development platform based on Roslyn workspaces. It provides project dependencies and C# language services to various IDEs and plugins via HTTP."
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('mono')
noextract=('$pkgname-$pkgver.tar.gz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp.http-mono.tar.gz")
sha256sums=('691098632f70bd3c4b7ed22a624971c04a27f95320fdba6085cff6bd2986bcbe')

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    tar -xf $srcdir/$pkgname-$pkgver.tar.gz -C $pkgdir/opt/$pkgname
    chown -R root:root "$pkgdir/opt/$pkgname"
    chmod -R 0644 "$pkgdir/opt/$pkgname"
    find "$pkgdir/opt/$pkgname" -type d -exec chmod 0755 {} \;
    find "$pkgdir/opt/$pkgname" -type f -name "*.exe" -exec chmod 0755 {} \;
}
