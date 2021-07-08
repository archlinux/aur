# Maintainer: Thomas Le Duc <dev@tleduc.de>
pkgname='rn'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Rename files and directories.'
arch=('x86_64')
url='https://github.com/thled/rn'
license=('MIT')
depends=()
makedepends=('cargo' 'git')
checkdepends=()
optdepends=()
provides=('rn')
conflicts=('rn')
source=("git+https://github.com/thled/rn.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname/app"
    cargo build --release
}

package() {
    cd $pkgname
    install -Dm755 "app/target/release/rn" "$pkgdir/usr/bin/rn"
}
