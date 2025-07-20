pkgname=eact
pkgver=1.9
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distrobuted."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm" "wine" "zip")
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('e31d1f05fb31e154a0e5fb7548e323099819c1d81d800bd06ef8ded9189404b2')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
