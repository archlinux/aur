# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname="genpw"
pkgver=0.0.3
pkgrel=3
pkgdesc="Minimal password generator for Linux using /dev/urandom"
arch=("any")
url="https://git.sr.ht/~nicknb/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=("xclip: for copying passwords to clipboard on X11"
            "wl-clipboard: for copying passwords to clipboard on Wayland")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('427cdc3b4393444c0e25ce12a62d1169773c1afe115ab3c4b4c11d457bda5829')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/genpw/LICENSE
    install -Dm 644 $pkgname.1 $pkgdir/usr/share/man/man1/${pkgname}.1
    install -Dm 644 completion/$pkgname.bash $pkgdir/usr/share/bash-completion/completions/${pkgname}
    install -Dm 644 completion/$pkgname.zsh $pkgdir/usr/share/zsh/site-functions/_${pkgname}
    install -Dm 644 completion/$pkgname.fish $pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish
    gzip $pkgdir/usr/share/man/man1/${pkgname}.1
}
