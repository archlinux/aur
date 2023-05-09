# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Loic Guegan <loic.guegan@mailbox.org>
pkgname=ochess
pkgver=v0.0.2
pkgrel=1
epoch=
pkgdesc="Chess game analysis software written in c++"
arch=("any")
url="https://ochess.fr"
license=('GPLv3')
groups=()
depends=(wxwidgets-gtk3)
makedepends=(cmake wxwidgets-common)
source=("http://loicguegan.com/files_/ochess-v0.0.2.tar.gz")
sha256sums=(fb23b73c1cefc9b4c13f1f610f30d95d47020d5388cf4ee40ce3605a5d39e25c) #generate with 'makepkg -g'

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ../
    make -j4
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cd build
    install -Dm775 ochess "${pkgdir}/usr/bin/ochess"
}
