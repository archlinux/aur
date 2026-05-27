# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=clean-my-keys-bin
_pkgname=clean-my-keys
pkgver=1.2.1
pkgrel=1
pkgdesc="Utility to safely lock and clean your keyboard without breaking your workflow (Precompiled Binary)"
arch=('x86_64')
url="https://github.com/Strawberry-Foundations/clean-my-keys"
license=('MIT')
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "$_pkgname-$pkgver::https://github.com/Strawberry-Foundations/clean-my-keys/releases/download/v$pkgver/clean-my-keys-linux-amd64"
  "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
  "README-$pkgver::$url/raw/v$pkgver/README.md"
  "icon-$pkgver.svg::$url/raw/v$pkgver/assets/image/icon.svg"
  "$_pkgname-$pkgver.desktop::$url/raw/v$pkgver/clean-my-keys.desktop"
)

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "$srcdir/README-$pkgver" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    
    install -Dm644 "$srcdir/icon-$pkgver.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
    install -Dm644 "$srcdir/$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}