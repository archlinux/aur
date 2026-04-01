# Maintainer: Dunky <braxtinmoss13@gmail.com>
pkgname=pacfzf
pkgver=0.4.0
pkgrel=1
pkgdesc="fzf-based interactive package manager for Arch Linux"
arch=('any')
url="https://github.com/mossbraxtin/pacfzf"
license=('MIT')
depends=('fzf' 'pacman' 'yay' 'paru')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b00580058f865464e44a7303811ecf239f2d33e84eb6338111bf89106ccaeb0ad5d1612959508f27727174179b31613de2ea86cb08122a816352eee575fe09b8')

build() {
cd "$pkgname-$pkgver"
scdoc < pacfzf.1.scd > pacfzf.1
}

package() {
cd "$pkgname-$pkgver"
install -Dm755 pacfzf "$pkgdir/usr/bin/pacfzf"
install -Dm644 pacfzf.1 "$pkgdir/usr/share/man/man1/pacfzf.1"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
install -Dm644 completions/bash/pacfzf "$pkgdir/usr/share/bash-completion/completions/pacfzf"
install -Dm644 completions/zsh/_pacfzf "$pkgdir/usr/share/zsh/site-functions/_pacfzf"
install -Dm644 completions/fish/pacfzf.fish "$pkgdir/usr/share/fish/vendor_completions.d/pacfzf.fish"
}
