# Maintainer: acuteenvy
pkgname=tldrtool-bin
_pkgname=tldrtool
pkgver=1.0.1
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
b2sums=('5825310f08d6a68f48b11f30d90b42a899f4859dc74c4af4d9e1ba44f78bf9050b93e8e3c2c549e6dbc692e4fae5f6b134fdecdab41233d08aed1f633a8556da')

package() {
    install -Dm755 tlt -t "$pkgdir/usr/bin"
    install -Dm644 tlt.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
