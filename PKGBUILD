# Maintainer: Wesley Moore <wes@wezm.net>
_pkgname=fd
pkgname=fd-rs-git
pkgver=119
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url="https://github.com/sharkdp/fd"
license=('MIT')
depends=()
conflicts=('fd', 'fd-rs')
provides=('fd-rs')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/sharkdp/fd.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    cargo build --release
    install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
