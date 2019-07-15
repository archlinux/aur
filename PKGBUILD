# Maintainer: James Brink <brink.james@gmail.com>

_pkgname=omnisharp-roslyn-http
pkgname=$_pkgname-bin
pkgver=1.33.0
pkgrel=4
pkgdesc=".NET development platform based on Roslyn workspaces. It provides project dependencies and C# language services to various IDEs and plugins via HTTP."
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('mono' 'libuv')
noextract=('$_pkgname-$pkgver.tar.gz')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp.http-mono.tar.gz")
sha256sums=('691098632f70bd3c4b7ed22a624971c04a27f95320fdba6085cff6bd2986bcbe')

package() {
    mkdir -p "$pkgdir/opt/$_pkgname"
    tar -xf $srcdir/$_pkgname-$pkgver.tar.gz -C $pkgdir/opt/$_pkgname
    chown -R root:root "$pkgdir/opt/$_pkgname"
    chmod -R 0644 "$pkgdir/opt/$_pkgname"
    find "$pkgdir/opt/$_pkgname" -type d -exec chmod 0755 {} \;
    find "$pkgdir/opt/$_pkgname" -type f -name "*.exe" -exec chmod 0755 {} \;
}
