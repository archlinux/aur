# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=3.0.11
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
source=("https://raw.githubusercontent.com/exercism/cli/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/exercism/cli/v$pkgver/shell/exercism_completion.bash"
        "https://raw.githubusercontent.com/exercism/cli/v$pkgver/shell/exercism_completion.zsh")

sha256sums=('5dd14ba854091ff4226fa6c7517b57da86acbe9b6a00c36f0c031dd4f4816c90'
            '4abb9b94262a08ede1019cbfc900d01f33123de616bb5a7c202d54ca59718590'
            '69dbcfad5c4fcc096a13e48d13a0ddc9d899ee299528081eca26ee801af7634d')
source_i686=(exercism-linux-32bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-32bit.tgz")
sha256sums_i686=('7c22143b358e6e4370f6f1d0721f7167d8221bd0d74addd9fb94c9a4755f51a8')
source_x86_64=(exercism-linux-64bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-64bit.tgz")
sha256sums_x86_64=('bf0a55abc27cbdcfcc1cba4336eafdec3486b2434b96017b75d54ec8fc7a3360')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 exercism_completion.bash "$pkgdir/usr/share/$pkgname/completion/exercism_completion.bash"
    install -D -m644 exercism_completion.zsh "$pkgdir/usr/share/$pkgname/completion/exercism_completion.zsh"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
