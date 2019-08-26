# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20151229
pkgrel=2
pkgdesc='manage config files in HOME via fake bare git repositories'
arch=('any')
url='https://github.com/RichiH/vcsh'
license=('GPL')
depends=('git')
optdepends=('myrepos: helps manage a large number of repositories')
source=("https://github.com/RichiH/$pkgname/archive/v$pkgver.zip")
_src_dir="$pkgname-$pkgver"
sha256sums=('817874ee1022732197e10d385eb9c88f2d7a5629a067761f0dd5ca9459d40a8e')

prepare() {
    cd "$_src_dir"

    sed -i 's|\(install:\) all|\1|' Makefile
}

package() {
    cd "$_src_dir"

    make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}
