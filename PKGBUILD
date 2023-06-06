# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Loic Guegan <loic.guegan@mailbox.org>
pkgname=ochess
pkgver=v0.0.3
pkgrel=1
epoch=
pkgdesc="Chess game analysis software written in c++"
arch=("any")
url="https://ochess.fr"
license=('GPLv3')
groups=()
depends=(wxwidgets-gtk3)
makedepends=(cmake wxwidgets-common)
source=("http://loicguegan.com/files_/ochess-v0.0.3.tar.gz")
sha256sums=(24dc1932c36ef62b33b3353a857133de3c5f527b6ccf875ac15c65e1750a3608) #generate with 'makepkg -g'

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake ../
    make -j4
}

package() {
    cd "$srcdir/$pkgname"
    cd build
    install -Dm775 ochess "${pkgdir}/usr/bin/ochess"
}
