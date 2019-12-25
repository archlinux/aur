# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.0.13
pkgrel=2
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
conflicts=(exercism)
replaces=("exercism-cli")
license=("MIT")

source_i686=(${_rel_url}/exercism-${pkgver}-linux-i386.tar.gz)
sha256sums_i686=('36afe02fbfc8f5fe17033d6982e74e51ba072991d08ef12f22a78fa74c30a864')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('8abcd78d9fbf9c580381e86e611f50a0d5efd88aed06100cd1e4d12ee41440d2')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D -m644 shell/exercism_completion.bash "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
    install -D -m644 shell/exercism_completion.zsh "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -D -m644 shell/exercism.fish "$pkgdir/usr/share/fish/vendor_completions.d/exercism.fish"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
