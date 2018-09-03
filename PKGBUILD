# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=3.0.9
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
source=("https://raw.githubusercontent.com/exercism/cli/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/exercism/cli/v$pkgver/shell/exercism_completion.bash"
        "https://raw.githubusercontent.com/exercism/cli/v$pkgver/shell/exercism_completion.zsh")

sha256sums=('5dd14ba854091ff4226fa6c7517b57da86acbe9b6a00c36f0c031dd4f4816c90'
            '38e5f3a52e7f6d878813f1b176737ae00f3a7f78ad142e1df70e1e5ff6b850df'
            '00821f0b917b6e9b32edb811cdfcc4991bb305198e79feb7d349be96d69ed2c4')
source_i686=(exercism-linux-32bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-32bit.tgz")
sha256sums_i686=('0334c457c4ac93767aff63269d030afb70ce6f8ba5f92e0bf29a278024f0d187')
source_x86_64=(exercism-linux-64bit-v$pkgver.tgz::"https://github.com/exercism/cli/releases/download/v$pkgver/exercism-linux-64bit.tgz")
sha256sums_x86_64=('856e0acc8306fb351a410d2717a7126e957fe54f8b6a55183c482a35c5900e64')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 exercism_completion.bash "$pkgdir/usr/share/$pkgname/completion/exercism_completion.bash"
    install -D -m644 exercism_completion.zsh "$pkgdir/usr/share/$pkgname/completion/exercism_completion.zsh"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
