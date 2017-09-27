# Maintainer: Wesley Moore <wes@wezm.net>
_pkgname=dopen
pkgname=dopen-git
pkgver=2
pkgrel=1
pkgdesc='Execute .desktop files from the command line'
arch=('i686' 'x86_64')
url="https://github.com/tmccombs/dopen"
license=('APACHE')
depends=()
conflicts=($_pkgname)
provides=($_pkgname)
makedepends=('rust' 'cargo' 'git')
source=("git+$url.git")
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
