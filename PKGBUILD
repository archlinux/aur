# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20151229
pkgrel=3
pkgdesc='manage config files in HOME via fake bare git repositories'
arch=('any')
url="https://github.com/RichiH/$pkgname"
license=('GPL')
depends=('git')
optdepends=('myrepos: helps manage a large number of repositories')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RichiH/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ae069506b0490287aefa582ab4e6af1c7ebc4dca743b17d91e0c8d0327d7a3fa')
_src_dir="$pkgname-$pkgver"

prepare() {
    cd "$_src_dir"
    sed -i 's|\(install:\) all|\1|' Makefile
}

package() {
    cd "$_src_dir"
    make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}
