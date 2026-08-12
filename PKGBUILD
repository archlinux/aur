# Maintainer: tee < teeaur at duck dot com >
pkgname=lakefs-bin
pkgver=1.85.0
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
sha256sums_x86_64=('63207607be489be590c91cb4ee2b1729241f94b15d2f8fca78da4df21b2044bd')
sha256sums_aarch64=('1507fcc90c333c6f7af97d7e24bedb27d3b33dd0049a2fc2849cf5d8f9aebe5a')

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
