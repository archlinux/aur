# Maintainer: Manuel Mazzuola <origin.of+aur@gmail.com>
# Contributor: Braeden Mollot <3mollot at gmail dot com>
pkgname=min-browser-beta-bin
pkgver=1.8.0beta1
_pkgver=1.8.0-beta1
pkgrel=1
pkgdesc="A faster, smarter web browser."
arch=('x86_64')
url="https://palmeral.github.io/min/"
license=('Apache')
depends=('libxtst' 'libxss' 'gconf' 'desktop-file-utils' 'nss' 'gnuplot')
install=$pkgname.install
source=("https://github.com/minbrowser/min/releases/download/v${_pkgver}/Min_${_pkgver}_amd64.deb")
noextract=("Min_${pkgver}_amd64.deb")
md5sums=('b33937ebf85e1a06fef77c41c3aa60ee')
conflicts=('min' 'min-browser-bin')

prepare() {
    ar -x "Min_${_pkgver}_amd64.deb"
    tar -xf "data.tar.xz"
    rm "Min_${_pkgver}_amd64.deb" "control.tar.xz" "data.tar.xz" "debian-binary"
}

package() {
    mv usr ${pkgdir}/
}
