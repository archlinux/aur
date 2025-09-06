# Maintainer: tee < teeaur at duck dot com >
# Contributor: wilke
# Contributor: envolution

pkgname=harsh-bin
pkgver=0.11.2
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('x86_64')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')
sha256sums_x86_64=('796e9dabacc7e26a96cc59a74d9d18f432d54c6d210a60604d2dc4a1a4b0ad83')
source_x86_64=("$url/releases/download/v$pkgver/harsh_Linux_x86_64.tar.gz")

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
