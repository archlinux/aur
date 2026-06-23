# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane-bin
_pkgname=gitpane
pkgver=0.7.15
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=('git')
makedepends=('cargo')
options=(
    !debug
    !strip
)
provides=('gitpane')
conflicts=('gitpane' 'gitpane-git')
source=("LICENSE::https://raw.githubusercontent.com/affromero/$_pkgname/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5953e81de31e9fbf77306d93feac10000c25889ec5a35c1e954d0d6efc3fd794')
sha256sums_x86_64=('367e6ff154a905971783ffe30d970c5211ef23c1a88e1de1439f1a83c946ef6b')
sha256sums_aarch64=('88e1cc749d7351a03c06dde4bb51e4776f0f23bab2657b4992cc4c2378f50e64')

package() {
    install -Dm0755 gitpane "$pkgdir/usr/bin/gitpane"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
