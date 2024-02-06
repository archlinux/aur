# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Loic Guegan <loic.guegan@mailbox.org>
pkgname=ochess
pkgver=v0.0.4
pkgrel=1
epoch=
pkgdesc="Chess game analysis software written in c++"
arch=("any")
url="https://ochess.fr"
license=('GPLv3')
groups=()
depends=(wxwidgets-gtk3)
makedepends=(cmake wxwidgets-common)
source=("https://ochess.fr/files/ochess-v0.0.4.tar.gz")
sha256sums=(c70ed1a8558312c646fc4c9cab74eb8a30677838a38b79baaa967e79801a72ed) #generate with 'makepkg -g'

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
