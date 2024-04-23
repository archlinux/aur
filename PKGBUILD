pkgname=eact
pkgver=1.0.5
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distrobuted."
arch=('any')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm")
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('9345a56b7043d1abfa8d0eea4ee3163c03bcfa4f633366a40ab21a0baf00980f')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
