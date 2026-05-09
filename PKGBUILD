# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=anirss
pkgver=0.2.0
pkgrel=1
pkgdesc="Search nyaa.si and hand the result to qBittorrent"
arch=('any')
url="https://github.com/marcusbandit/anirss"
license=('GPL-3.0-or-later')
depends=('python' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/anirss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c47f5d1ee21c547c3d3da90bf4c4f09f606533cf2a5b224ee869c6103538fb26')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 anirss               "$pkgdir/usr/bin/anirss"
    install -Dm644 README.md            "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE              "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 completions/_anirss  "$pkgdir/usr/share/zsh/site-functions/_anirss"
    install -Dm644 completions/anirss.bash "$pkgdir/usr/share/bash-completion/completions/anirss"
}
