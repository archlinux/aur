# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=3.0.12
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")

source=("https://raw.githubusercontent.com/exercism/cli/v$pkgver/LICENSE"
        exercism_completion-v$pkgver.bash::"https://raw.githubusercontent.com/exercism/cli/v$pkgver/shell/exercism_completion.bash"
        exercism_completion-v$pkgver.zsh::"https://raw.githubusercontent.com/exercism/cli/v$pkgver/shell/exercism_completion.zsh")
sha256sums=('5dd14ba854091ff4226fa6c7517b57da86acbe9b6a00c36f0c031dd4f4816c90'
            '4abb9b94262a08ede1019cbfc900d01f33123de616bb5a7c202d54ca59718590'
            'b28df2a4f6099f5466c623a3618c58dea68611858153442fea978deb5fe027df')

source_i686=(exercism-linux-32bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-32bit.tgz")
sha256sums_i686=('b16f2918999ada0b5452055b69c45e7d93410cf3e1a40892142ab721368230d2')
source_x86_64=(exercism-linux-64bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-64bit.tgz")
sha256sums_x86_64=('9e212387f8256cf52039b2f6cad122ec7c8739f9fcd15ae57c908886953df0e3')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 exercism_completion-v$pkgver.bash "$pkgdir/usr/share/$pkgname/completion/exercism_completion.bash"
    install -D -m644 exercism_completion-v$pkgver.zsh "$pkgdir/usr/share/$pkgname/completion/exercism_completion.zsh"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
