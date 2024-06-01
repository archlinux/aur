pkgname=eact
pkgver=1.0.6
pkgrel=1
pkgdesc="A toolkit for building your electron applications with Electron-packager and electron-build for non DRM and DRM applications and then zip them up ready for you to be distrobuted."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=("git" "npm")
source=("$url/eact/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('94281bbe5d7a0eeaf1e6062ac130d43334cf4a7036f5b8231bf48ca58c2bfeae')

package() {
    for dir in $pkgname-$pkgver-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
