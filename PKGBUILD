# Maintainer: Braeden Mollot <3mollot at gmail dot com>
pkgname=min-browser-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A faster, smarter web browser."
arch=('x86_64')
url="https://palmeral.github.io/min/"
license=('unknown')
depends=('libxtst' 'nodejs' 'gconf' 'desktop-file-utils' 'nss' 'libnotify' 'gnuplot')
install=$pkgname.install
source=("https://github.com/PalmerAL/min/releases/download/v${pkgver}/Min_${pkgver}_amd64.deb")
noextract=("Min_${pkgver}_amd64.deb")
md5sums=('247ca4bf46b953c47dd5b7b406c00295')

prepare() {
	ar vx "Min_${pkgver}_amd64.deb"
    tar -xvf "data.tar.xz"
    rm "Min_${pkgver}_amd64.deb" "control.tar.gz" "data.tar.xz" "debian-binary"
}

package() {
    mv usr ${pkgdir}/
}
