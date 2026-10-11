# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ghr-bin
_pkgname=ghr
pkgver=0.9.1
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
sha256sums_x86_64=('ce7bb0b82d94cdc25e1abbbdff541b60acc2371db19a935e05a093d19b7fc516')
sha256sums_aarch64=('c358e644483ac60b94f69b78d1fe48c507db856e20567428606eea5968dd84dc')

package() {
    cd "ghr-v$pkgver-$CARCH-unknown-linux-gnu"
    install -Dm0755 ghr "$pkgdir/usr/bin/ghr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
