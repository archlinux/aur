# Maintainer: tuftedocelot@fastmail.fm
_pkgname=exa
pkgname=${_pkgname}-git
pkgver=560
pkgrel=1
pkgdesc='Replacement for ls written in Rust.'
arch=('i686' 'x86_64')
url="https://github.com/ogham/exa"
license=('MIT')
depends=('libssh2')
makedepends=('cmake' 'rust' 'cargo' 'git')
source=("git+https://github.com/ogham/exa.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    make
    install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname/contrib/man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
