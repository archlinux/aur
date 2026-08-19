# Maintainer: tee < teeaur at duck dot com >
pkgname=lakefs-bin
pkgver=1.86.0
pkgrel=1
pkgdesc="Data version control for your data lake | Git for data"
arch=(x86_64 aarch64)
url="https://lakefs.io"
_src="https://github.com/treeverse/lakeFS"
license=('Apache-2.0')
provides=('lakefs')
conflicts=('lakefs')
source_x86_64=("$_src/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$_src/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('dc02b075ddcbb0984f96f6be2e0e08d74bd0967920ec89dd00a97b5d400ad8eb')
sha256sums_aarch64=('a214e8713775e604f9e7ea3726fc808ccc9770ebb75a3b60ed362f1406312547')

package() {
    install -Dm755 lakefs lakectl -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 <(./lakefs completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/lakefs"
    install -Dm644 <(./lakefs completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/lakefs.fish"
    install -Dm644 <(./lakefs completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_lakefs"
    install -Dm644 <(./lakectl completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/lakectl"
    install -Dm644 <(./lakectl completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/lakectl.fish"
    install -Dm644 <(./lakectl completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_lakectl"
}
