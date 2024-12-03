pkgname=eact
pkgver=1.0.8
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distrobuted."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm" "wine")
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('14dfe2a1e18571c25b2b65653e26d59b4b479739fb326f4ec1b99afa93b2b8f2')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
