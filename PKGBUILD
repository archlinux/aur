# Maintainer: zeroz <zeroz@none.cx>

pkgname=checkpac
pkgver=0.10.0
pkgrel=1
pkgdesc="Simple and fast package check and lookup utility for Arch Linux with AUR support"
arch=('any')
url="https://github.com/zeroz41/checkpac"
license=('GPL-3.0-or-later')
depends=('bash' 'expac' 'util-linux' 'jq' 'pacman')
#no optdepends yet
#optdepends=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeroz41/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0b1dcf6e41c1aefe7faf32763918bcf10549a36d1ff8d15dee7a62714973a44d')

package() {
    cd "$pkgname-$pkgver"
    
    # tools
    install -Dm755 "bin/checkpac" "$pkgdir/usr/bin/checkpac"
    
    # docs
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # tab completions
    install -Dm644 "completion/bash/checkpac-completion.bash" \
        "$pkgdir/usr/share/bash-completion/completions/checkpac"
}
sha256sums=('0b1dcf6e41c1aefe7faf32763918bcf10549a36d1ff8d15dee7a62714973a44d')
