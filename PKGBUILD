# Maintainer: tee < teeaur at duck dot com >
pkgname=lakefs-bin
pkgver=1.80.0
pkgrel=1
pkgdesc="Data version control for your data lake | Git for data"
arch=(x86_64 aarch64)
url="https://github.com/treeverse/lakeFS"
license=('Apache-2.0')
provides=('lakefs')
conflicts=('lakefs')
source_x86_64=("$url/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f2c6254a5cbdc8d85c65da571ba93cbcb197622734d8c344fe465c5da2d98a68')
sha256sums_aarch64=('01e79b97d77cf20b060fde035d94a9fcd7b5b115b53c9622ff3c39755db52a2a')

package() {
    install -Dm755 lakefs -t "$pkgdir/usr/bin"
    install -Dm755 lakectl -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 <(./lakefs completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/lakefs"
    install -Dm644 <(./lakefs completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/lakefs.fish"
    install -Dm644 <(./lakefs completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_lakefs"
}
