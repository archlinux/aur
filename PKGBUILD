# Maintainer: zeroz <zeroz@none.cx>

pkgname=checkpac
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple and fast package check and lookup utility for Arch Linux with AUR support"
arch=('any')
url="https://github.com/zeroz41/checkpac"
license=('GPL3')
depends=('bash' 'expac' 'util-linux' 'jq' 'pacman')
#no optdepends yet
#optdepends=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeroz41/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('25789e676184bddd9816b3e7e828d59a59326def031129e9f6f8a1730dc372fc')

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