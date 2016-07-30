# Maintainer: Braeden Mollot <3mollot at gmail dot com>
pkgname=min-browser-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A faster, smarter web browser."
arch=('x86_64')
url="https://palmeral.github.io/min/"
license=('Apache')
depends=('libxtst' 'libxss' 'nodejs' 'gconf' 'desktop-file-utils' 'nss' 'gnuplot')
install=$pkgname.install
source=("https://github.com/minbrowser/min/releases/download/v${pkgver}/Min_${pkgver}_amd64.deb")
noextract=("Min_${pkgver}_amd64.deb")
md5sums=('622582b10fc13984c04d95ef4a390c70')

prepare() {
	ar vx "Min_${pkgver}_amd64.deb"
    tar -xvf "data.tar.xz"
    rm "Min_${pkgver}_amd64.deb" "control.tar.gz" "data.tar.xz" "debian-binary"
}

package() {
    mv usr ${pkgdir}/
}
