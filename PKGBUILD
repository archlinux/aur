# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane-bin
_pkgname=gitpane
pkgver=0.18.13
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=(
    'git'
    'xdg-utils'
)
optdepends=(
    'github-cli: For improved github integration'
)
options=(
    !debug
    !strip
)
provides=('gitpane')
conflicts=('gitpane' 'gitpane-git')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/affromero/$_pkgname/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5953e81de31e9fbf77306d93feac10000c25889ec5a35c1e954d0d6efc3fd794')
sha256sums_x86_64=('3fb504d31ceef5e69aef82574af1fd198730f30c7e0ceb41ee5f455e77331875')
sha256sums_aarch64=('4c660560c6f8ba577ad19e265d6b546b181b3c6514a05e66d7e3d59a4888c2e9')

package() {
    install -Dm0755 gitpane "$pkgdir/usr/bin/gitpane"
    install -Dm644 LICENSE-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
