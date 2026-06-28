# Maintainer: tee < teeaur at duck dot com >
pkgname=lakefs-bin
pkgver=1.82.0
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
sha256sums_x86_64=('d5140a104949ae7c1800f6379444434a8e5cbbf102a000d3542c43a7544b8bc9')
sha256sums_aarch64=('2177c11577fdf6e81c04177bed428e17c95e84e6d8d228647f451b3744427f0d')

package() {
    install -Dm755 lakefs lakectl -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 <(./lakefs completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/lakefs"
    install -Dm644 <(./lakefs completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/lakefs.fish"
    install -Dm644 <(./lakefs completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_lakefs"
    install -Dm644 <(./lakectl completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/lakectl"
    install -Dm644 <(./lakectl completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/lakectl.fish"
    install -Dm644 <(./lakectl completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_lakectl"
}
