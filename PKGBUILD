# Maintainer: acuteenvy
pkgname=tldrtool-bin
_pkgname=tldrtool
pkgver=1.0.1
pkgrel=2
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
b2sums=('0a4a0613e52263050c364900e96a99216667033136ef78cde3796c412d24e469d6418a5db2b24c2ced80e36d0c2864265552276ca3018b4599fd84ef12dd75a3')

package() {
    install -Dm755 tlt -t "$pkgdir/usr/bin"
    install -Dm644 tlt.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
