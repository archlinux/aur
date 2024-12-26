# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname="carch"
pkgver=4.1.0
pkgrel=2
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$pkgname"
license=('GPL')
options=(!strip)
depends=(
    "bash"
    "man-pages"
    "man-db"
    "zip"
    "gum"
    "git"
    "sed"
    "xdg-user-dirs"
    "wget"
    "figlet"
    "pacman"
    "unzip"
    "python"
    "gtk3"
    "noto-fonts-emoji"
    "ttf-joypixels"
    "curl"
    "tar"
)
conflicts=('carch-git')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {

    install -Dm755 "$srcdir/$pkgname-$pkgver/build/$pkgname" -t "$pkgdir/usr/bin/"
    
    install -Dm755 "$srcdir/$pkgname-$pkgver/gtk/$pkgname-gtk.py" -t "$pkgdir/usr/bin/"
   
    install -d "$pkgdir/usr/bin/scripts"
    rm -f "$srcdir/$pkgname-$pkgver/scripts/README"
    cp -r "$srcdir/$pkgname-$pkgver/scripts/." -t "$pkgdir/usr/bin/scripts"
   
    # license
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # doc
    install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1" "$pkgdir/usr/share/man/man.1/$pkgname.1"

}
