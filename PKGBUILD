# Maintainer: pinkorca <ali@pinkorca.net>
pkgname=namefix-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform filename validator and sanitizer"
arch=('any')
url="https://github.com/pinkorca/namefix"
license=('GPL3')
depends=('bash')
optdepends=('perl: for Unicode detection')
provides=('namefix')
conflicts=('namefix')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pinkorca/namefix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d5a0dc21a8bf0a6580b7764baf9ba33f0ebc281cd964c9bc74161c51ebd8d36')
package() {
    cd "namefix-$pkgver"
    install -Dm755 namefix.sh "$pkgdir/usr/bin/namefix"
    install -Dm644 namefix.1 "$pkgdir/usr/share/man/man1/namefix.1"
    install -Dm644 completions/namefix.bash "$pkgdir/usr/share/bash-completion/completions/namefix"
    install -Dm644 completions/namefix.zsh "$pkgdir/usr/share/zsh/site-functions/_namefix"
    install -Dm644 completions/namefix.fish "$pkgdir/usr/share/fish/vendor_completions.d/namefix.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
