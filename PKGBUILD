# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname="genpw"
pkgver=0.0.3
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
sha256sums=('3cdebbe8a545d1d9e8a49988c32259294a5ef767f7e3a69d366f08ccae8c3485')

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/genpw/LICENSE
    install -Dm 644 $pkgname.1 $pkgdir/usr/share/man/man1/${pkgname}.1
    install -Dm 644 completion/$pkgname.bash $pkgdir/usr/share/bash-completion/completions/${pkgname}
    install -Dm 644 completion/$pkgname.zsh $pkgdir/usr/share/zsh/site-functions/_${pkgname}
    install -Dm 644 completion/$pkgname.fish $pkgdir/usr/share/fish/completions/${pkganme}.fish
    gzip $pkgdir/usr/share/man/man1/${pkgname}.1
}
