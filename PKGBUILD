# Maintainer: James Brink <brink.james@gmail.com>

_pkgname=omnisharp-roslyn-stdio
pkgname=$_pkgname-bin
pkgver=1.33.0
pkgrel=2
pkgdesc=".NET development platform based on Roslyn workspaces. It provides project dependencies and C# language services to various IDEs and plugins via STDIO."
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('mono')
noextract=('$_pkgname-$pkgver.tar.gz')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp-mono.tar.gz")
sha256sums=('c3bd370b0e31838418756f3879269b224b1920d6f3527c8f711d661dfc008c8c')

package() {
    mkdir -p "$pkgdir/opt/$_pkgname"
    tar -xf $srcdir/$_pkgname-$pkgver.tar.gz -C $pkgdir/opt/$_pkgname
    chown -R root:root "$pkgdir/opt/$_pkgname"
    chmod -R 0644 "$pkgdir/opt/$_pkgname"
    find "$pkgdir/opt/$_pkgname" -type d -exec chmod 0755 {} \;
    find "$pkgdir/opt/$_pkgname" -type f -name "*.exe" -exec chmod 0755 {} \;
}
