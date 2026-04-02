# Maintainer: Dunky <braxtinmoss13@gmail.com>
pkgname=fzfocus
pkgver=0.1.0
pkgrel=1
pkgdesc="fzf-based personal info manager — calendar, todos, and notes in the terminal"
arch=('any')
url="https://github.com/mossbraxtin/fzfocus"
license=('MIT')
depends=('fzf' 'neovim' 'sqlite' 'bat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('39cf824140e3d4f4f5b9d2cdaf78eebe82ff97ba37cbfdf8e58327441f9ce1de20c659f13ecea955138c83050b3fee53078e969b56a53e5add3a5f5104908d60')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 fzfocus "$pkgdir/usr/bin/fzfocus"
    install -Dm644 lib/db.sh       "$pkgdir/usr/lib/fzfocus/db.sh"
    install -Dm644 lib/todos.sh    "$pkgdir/usr/lib/fzfocus/todos.sh"
    install -Dm644 lib/notes.sh    "$pkgdir/usr/lib/fzfocus/notes.sh"
    install -Dm644 lib/calendar.sh "$pkgdir/usr/lib/fzfocus/calendar.sh"
    install -Dm644 lib/dashboard.sh "$pkgdir/usr/lib/fzfocus/dashboard.sh"
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 completions/bash/fzfocus \
        "$pkgdir/usr/share/bash-completion/completions/fzfocus"
    install -Dm644 completions/zsh/_fzfocus \
        "$pkgdir/usr/share/zsh/site-functions/_fzfocus"
    install -Dm644 completions/fish/fzfocus.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/fzfocus.fish"
}
