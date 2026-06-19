# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ghr-bin
_pkgname=ghr
pkgver=0.8.2
pkgrel=1
pkgdesc='GitHub in your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/chenyukang/ghr'
license=('MIT')
depends=('github-cli')
options=(!debug)
provides=('ghr')
conflicts=('ghr-git' 'ghr')
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/ghr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/ghr-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('574ecd59e0965f1be1da8d56c48ae5e5945b39f57fc938e5254a83cdb131b78b')
sha256sums_aarch64=('470177a7bae18395c8d2bd70319c7206ee9e47faf019042aec361e71ede8d879')

package() {
    cd "ghr-v$pkgver-$CARCH-unknown-linux-gnu"
    install -Dm0755 ghr "$pkgdir/usr/bin/ghr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
