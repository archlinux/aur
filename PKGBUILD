# Maintainer: tee < teeaur at duck dot com >
pkgname=lakefs-bin
pkgver=1.79.0
pkgrel=1
pkgdesc="Data version control for your data lake | Git for data"
arch=(x86_64 aarch64)
url="https://github.com/treeverse/lakeFS"
license=('Apache-2.0')
provides=('lakefs')
conflicts=('lakefs')
source_x86_64=("$url/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('992009503b3f854ae7c05af4939bf05498fcdeca595c8ac0c3afde6344c01475')
sha256sums_aarch64=('bbb040ca77ada04c70541cc86f85b9482136945ca66c35ff434d4b8fadde8c77')

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
