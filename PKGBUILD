# Maintainer: Cyridge cyridge@proton.me
pkgname=rsv-ng
pkgver=133
pkgrel=1
_commit=d9408b025e368ea5f793b69a55551d02c44072cd
pkgdesc="A runit service manager with smart completions, scaffolding, and more"
arch=('any')
url="https://gitlab.com/runit-rsv/rsv-main"
license=('GPL-2.0-only')
depends=('runit')
optdepends=('sudo: privilege escalation'
            'opendoas: privilege escalation (alternative to sudo)')
provides=('rsv-ng')
conflicts=('rsv')
source=("$pkgname-$_commit.tar.gz::$url/-/archive/$_commit/rsv-main-$_commit.tar.gz")
sha256sums=('e185be382b38883ffe76173c468ed57504f4b076a677be088a59f9c02845b335')

package() {
    cd "rsv-main-$_commit"
    install -Dm755 rsv      "$pkgdir/usr/bin/rsv"
    install -Dm644 rsv.bash "$pkgdir/usr/share/bash-completion/completions/rsv"
    install -Dm644 rsv.fish "$pkgdir/usr/share/fish/vendor_completions.d/rsv.fish"
    install -Dm644 rsv.zsh  "$pkgdir/usr/share/zsh/site-functions/_rsv"
    install -Dm644 rsv.nu   "$pkgdir/usr/share/nushell/vendor/autoload/rsv.nu"
    install -Dm644 rsv.elv  "$pkgdir/usr/share/elvish/lib/rsv.elv"
    install -Dm644 rsv.yash "$pkgdir/usr/share/yash/completion/rsv"
    install -Dm644 rsv.1    "$pkgdir/usr/share/man/man1/rsv.1"
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
