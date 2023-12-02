pkgname=eact
pkgver=1.0.2
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distrobuted."
arch=('any')
url="https://gitlab.com/libelectron/eact"
license=('GPL')
depends=("git" "npm")
source=("https://gitlab.com/libelectron/eact/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')

package() {
    for dir in $pkgname-$pkgver-$pkgrel-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}