# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ghr-bin
_pkgname=ghr
pkgver=0.8.1
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
sha256sums_x86_64=('ed577ef0a7198f8105e1d5e816af028bb591cbe6396d9238fb29526acf8357d1')
sha256sums_aarch64=('b167fb7bd415c18d351558101322a89cd027ffc283e53d46f97910847d45ad3a')

package() {
    cd "ghr-v$pkgver-$CARCH-unknown-linux-gnu"
    install -Dm0755 ghr "$pkgdir/usr/bin/ghr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
