# Maintainer: wallace < str(11) + my_id at gmail dot com>
# Maintainer: Iain Earl <iain at itmecho dot com>

pkgname='navi'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.15.1'
pkgrel='1'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=()
optdepends=('fzf' 'skim')
makedepends=('rust' 'gcc')
checkdepends=('rust' 'git')
provides=('navi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha256sums=('73d91f1c47df50cf4bb2fb5856f58b580a65a59090c847199bbf37ca421f8b3e')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/navi" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
