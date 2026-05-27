# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=clean-my-keys-bin
_pkgname=clean-my-keys
pkgver=1.2.2
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

sha256sums=('0d798a4675f4847705c545a4c2a5b8a79fe6b71e1de0f1a9051d97d7fdb9dee8' 'd51f1f359ebff4ce69acd6e22f450b75592989ed3e2157b727360ab368451271' '9af2bdfeec3412ffadd7e6904eefca24525fcaa074b2518ece1140bd41b2731a' '092c5079effeeb97056515fe2138d0e052a6063ae94295eebae8ead7e4df036a' '7835ff77e258aad5322feded0957a9bdb7575df467444006b27bbd353314c02b' )

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "$srcdir/README-$pkgver" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    
    install -Dm644 "$srcdir/icon-$pkgver.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
    install -Dm644 "$srcdir/$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}