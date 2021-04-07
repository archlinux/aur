# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20190621
pkgrel=1
pkgdesc='Version Control System for $HOME that manages multiple Git repositories'
arch=(any)
url="https://github.com/RichiH/$pkgname"
license=(GPL2)
depends=(git)
checkdepends=(perl perl-shell-command perl-test-most)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e7c108f98da16e5ec5ae41692552aff31ee02d7d8849e6bf6efdfa68ed697204')

build() {
    cd "$pkgname-$pkgver"
    make all=''
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' all='' install
}
