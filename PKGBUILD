# Maintainer: tuftedocelot@fastmail.fm
_pkgname=exa
pkgname=${_pkgname}-git
pkgver=329
pkgrel=1
pkgdesc='Replacement for ls written in Rust.'
arch=('i686' 'x86_64')
url="https://github.com/ogham/exa"
license='MIT'
depends=('libssh2')
makedepends=('cmake' 'rust')
install=exa-git.install
source=("git+https://github.com/ogham/exa.git" exa-git.install)
md5sums=('SKIP'
         '9e2ac3fa717f209869995438b1e5dc22')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    make
    install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname/man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
