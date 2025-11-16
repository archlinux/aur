# Contributor: tee < teeaur at duck dot com >
# Contributor: wilke
# Contributor: envolution

pkgname=harsh-bin
pkgver=0.11.10
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('x86_64')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')
sha256sums_x86_64=('2ff324731f8f59901d2ea340a7060a4b2e8799e85139ca1e67689a0fc0a7be2b')
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/$pkgver/harsh_Linux_x86_64.tar.gz")

package() {
    install -Dm755 harsh -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    ./harsh completion bash > "$pkgdir/usr/share/bash-completion/completions/harsh"

    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    ./harsh completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/harsh.fish"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    ./harsh completion zsh > "$pkgdir/usr/share/zsh/site-functions/_harsh"
}
