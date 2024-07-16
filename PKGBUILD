pkgname=eact
pkgver=1.0.7
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distrobuted."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm")
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('64f221f6c29cf35655c24177216f75e75679049f37190066be72830a86651237')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
