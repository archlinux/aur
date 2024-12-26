# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname="carch"
pkgver="v4.1.0"
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$pkgname"
license=('GPL')
options=(!strip)
depends=(
    "bash"
    "man-pages"
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
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
md5sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm0755 "build/$pkgname" -t "$pkgdir/usr/bin"

    install -Dm0755 "gtk/$pkgname-gtk.py" -t "$pkgdir/usr/bin"
    
    install -d "$pkgdir/usr/bin/scripts"
    install -Dm 0755 "scripts/*.sh" -t ${pkgdir}/usr/bin/scripts/
    

    install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
