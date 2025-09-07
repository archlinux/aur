# Maintainer: tee < teeaur at duck dot com >
# Contributor: wilke
# Contributor: envolution

pkgname=harsh-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('x86_64')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')
sha256sums_x86_64=('9384698f1edcd8cc95330dffcd0f8cb00ad0c54661b21a7d37490840f9c5e434')
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/harsh_Linux_x86_64.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    ./harsh completion bash > "$pkgdir/usr/share/bash-completion/completions/harsh"

    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    ./harsh completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/harsh.fish"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    ./harsh completion zsh > "$pkgdir/usr/share/zsh/site-functions/_harsh"
}
