# Maintainer: BitsBob <audeygodfrey@gmail.com>
pkgname=wikiosophy-bin
_pkgname=wikiosophy
pkgver=1.0
pkgrel=1
pkgdesc="CLI that follows the first body link of a Wikipedia article until it reaches Philosophy (prebuilt binary)"
arch=('x86_64')
url="https://github.com/BitsBob/wikiphilosophy"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::$url/releases/download/$pkgver/wikiosophy"
        "$_pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha256sums=('cdfd2475292ccb037b641bd9a853b19778aec8d211afcfc8a96a49654994db77'
            '55f697bf77df3b8fd8cf0fb735f533058003cee77a7c56d12ef8b7bda33fd354')

package() {
    install -Dm0755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 "$srcdir/$_pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
