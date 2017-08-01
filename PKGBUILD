# Maintainer: Wesley Moore <wes@wezm.net>
_pkgname=alt
pkgname=${_pkgname}-git
pkgver=103
pkgrel=1
pkgdesc='Command line utility that attempts to find the "alternate path" for the provided path'
arch=('i686' 'x86_64')
url="https://github.com/uptech/alt"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/uptech/alt.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    cargo build --release
    install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    #install -Dm644 "$srcdir/$_pkgname/contrib/man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
