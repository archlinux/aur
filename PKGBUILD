# Maintainer: acuteenvy
pkgname=tldrtool-bin
_pkgname=tldrtool
pkgver=1.0.0
pkgrel=1
pkgdesc="Automate contributing to tldr"
arch=('x86_64')
url="https://github.com/acuteenvy/$_pkgname"
license=('MIT')
depends=('git')
optdepends=(
    'tldr: view pages using a client'
    'xdg-utils: open a browser to create pull requests'
)
conflicts=('tldrtool')
provides=('tldrtool')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('ab91489f3af7d5d0edc51604b7e74df2c832a69b15a48b0957a406bed81b976e6e954dcd892b952049c08f478010832b5a1a44ac9b9538f6b2905171240d0b58')

package() {
    install -Dm755 tlt -t "$pkgdir/usr/bin"
    install -Dm644 tlt.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
