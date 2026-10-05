pkgname=eact
pkgver=2.11
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distributed."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm" "wine" "zip" )
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('6e02b714d2034ca0e1ee0a25f37cc15c473296d1cbc256d83dad1cc76061cac7')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
