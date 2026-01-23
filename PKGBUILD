# Maintainer: ReubenPercy/reubenpercival14@gmail.com
pkgname=rustfetch-git
pkgver=r1.abcdef0
pkgrel=1
pkgdesc="A fast system information fetch tool written in Rust"
arch=('x86_64' 'i686' 'aarch64')
url="https://codeberg.org/akirathelinuxguy/rustfetch"
license=('MIT')
depends=()
makedepends=('rust' 'git')
provides=('rustfetch')
conflicts=('rustfetch')
source=("git+https://codeberg.org/akirathelinuxguy/rustfetch.git")
sha256sums=('SKIP')

pkgver() {
    cd rustfetch
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd rustfetch
    rustc -O rustfetch.rs
}

package() {
    cd rustfetch
    install -Dm755 rustfetch "$pkgdir/usr/bin/rustfetch"
}
