# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=2.4.1
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
source=("https://raw.githubusercontent.com/exercism/cli/v$pkgver/LICENSE"
        'http://cli.exercism.io/exercism_completion.bash'
        'http://cli.exercism.io/exercism_completion.zsh')
sha256sums=('5dd14ba854091ff4226fa6c7517b57da86acbe9b6a00c36f0c031dd4f4816c90'
            '34f95744c648fa72b8397e1c3c9b73a39beaa2a026a6e094fd6e894974f25cd3'
            '2b84ac6a992060edd496e17a0b7ee786b273c9633ebee0d84af346cf05a8781a')
source_i686=(exercism-linux-32bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-32bit.tgz")
sha256sums_i686=('fff1d2fe7d87c99e681b4398167c22b27580b5a4f5f1e0bce8da7c928e2ef1dc')
source_x86_64=(exercism-linux-64bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-64bit.tgz")
sha256sums_x86_64=('bea54bee63105970ae75be889f78bece1377056e687eca59e6b32b9d58ea6502')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 exercism_completion.bash "$pkgdir/usr/share/$pkgname/completion/exercism_completion.bash"
    install -D -m644 exercism_completion.zsh "$pkgdir/usr/share/$pkgname/completion/exercism_completion.zsh"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
