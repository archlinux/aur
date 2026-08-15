# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ghr-bin
_pkgname=ghr
pkgver=0.9.0
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
sha256sums_x86_64=('51133e296afe3b078c00d82605a5a9698c44e9c78c0710240c97803d90867b30')
sha256sums_aarch64=('83a876429df10d09bd45caa307a0141caca04be8d7228031f7df42ef21be1845')

package() {
    cd "ghr-v$pkgver-$CARCH-unknown-linux-gnu"
    install -Dm0755 ghr "$pkgdir/usr/bin/ghr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
