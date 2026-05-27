# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=tunneled-bin
_pkgname=tunneled
pkgver=2.5.3
pkgrel=1
pkgdesc="A simple and powerful CLI tool for creating TCP tunnels (Precompiled Binary)"
arch=('x86_64') 
url="https://github.com/Strawberry-Foundations/tunneled"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "$_pkgname-$pkgver::https://github.com/Strawberry-Foundations/tunneled/releases/download/v$pkgver/tunneled-linux-amd64"
  "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
  "README-$pkgver::$url/raw/v$pkgver/README.md"
  "config.example-$pkgver.yml::$url/raw/v$pkgver/config.example.yml"
  "services.example-$pkgver.yml::$url/raw/v$pkgver/services.example.yml"
)

sha256sums=('7487e5a8ca864428f7b86cd990fb28711ef17c06c1e694ecbaf724774181293f' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' '9a5ab747a8781086bd0f2e0484edd6334d85bb74e7015bb503cfd64550731ecc' 'c72df6d496f75561f9769944d7cefc118b6cbbd8f23021f4130b77564c3797f1' '1f636eaf7f5c057943f6626ef4b04bf51aa2917c3dc021a8d7f9f3914a69ab4e' )

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "$srcdir/README-$pkgver" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    
    install -Dm644 "$srcdir/config.example-$pkgver.yml" "$pkgdir/usr/share/$_pkgname/config.example.yml"
    install -Dm644 "$srcdir/services.example-$pkgver.yml" "$pkgdir/usr/share/$_pkgname/services.example.yml"
}