pkgname=eact
pkgver=2.10
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distributed."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm" "wine" "zip" )
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('cfd5859b68457dd8bff05ef54b78973dd4a7f6eee9e9e769a04206ffabeabe7f')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
