pkgname=pakku-gui
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK frontend for pakku"
arch=("any") # If pakku and python can be installed, this too
url="https://gitlab.com/mrvik/pakku-gui"
license=("GPL2")
depends=("python" "python-gobject" "gtk3" "pakku")
source=("https://gitlab.com/mrvik/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar")
provides=($pkgname)
conflicts=($pkgname-git)
sha256sums=("9ca9afb4095d09a39377b98486bb93c97c4dd07de6c5482e7f9e55fe0a32432f")

package(){
    _libdir=$pkgdir/usr/lib/$pkgname
    _applications=$pkgdir/usr/share/applications
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$_libdir" "$_applications" "$pkgdir/usr/bin"
    cp *.py "$_libdir"
    cp "$pkgname.desktop" "$_applications"
    chmod +x "$_libdir/main.py"
    ln -s "/usr/lib/$pkgname/main.py" "$pkgdir/usr/bin/$pkgname"
}
