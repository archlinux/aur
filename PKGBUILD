# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname="genpw"
pkgver=0.0.1
pkgrel=1
pkgdesc="Minimal password generator for Linux using /dev/urandom"
arch=("any")
url="https://github.com/fk29g/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=("xclip: for copying passwords to clipboard on X11"
            "wl-clipboard: for copying passwords to clipboard on Wayland")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('526dd52707ea0203c9caabb10694a707f0a2b81401bd8ec0f53b126f6de048c9')

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/genpw/LICENSE
    install -Dm 644 $pkgname.1 $pkgdir/usr/share/man/man1/${pkgname}.1
    gzip $pkgdir/usr/share/man/man1/${pkgname}.1
}
