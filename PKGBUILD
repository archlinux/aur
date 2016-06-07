# Maintainer: Braeden Mollot <3mollot at gmail dot com>
pkgname=min-browser-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="A faster, smarter web browser."
arch=('x86_64')
url="https://palmeral.github.io/min/"
license=('Apache')
depends=('libxtst' 'libxss' 'nodejs' 'gconf' 'desktop-file-utils' 'nss' 'gnuplot')
install=$pkgname.install
source=("https://github.com/minbrowser/min/releases/download/v${pkgver}/Min_${pkgver}_amd64.deb")
noextract=("Min_${pkgver}_amd64.deb")
md5sums=('1fd6e4cfa67e156bd274a278686f7ac7')

prepare() {
	ar vx "Min_${pkgver}_amd64.deb"
    tar -xvf "data.tar.xz"
    rm "Min_${pkgver}_amd64.deb" "control.tar.gz" "data.tar.xz" "debian-binary"
}

package() {
    mv usr ${pkgdir}/
}
