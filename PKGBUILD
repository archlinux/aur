# Maintainer: ZorinArch < zorinarch at proton dot me >

_pkgname=crystal-dock
pkgname=${_pkgname}-bin
pkgver=2.16
pkgrel=1
pkgdesc="A cool dock (desktop panel) for Linux desktop."
arch=('x86_64')
url='https://github.com/dangvd/crystal-dock'
license=('GPL3')
options=('!strip' 'staticlibs')
depends=(qt6-base wayland layer-shell-qt)
optdepends=(kwin)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$url/releases/download/v$pkgver/${_pkgname}_${pkgver}-1_amd64.deb")

sha256sums_x86_64=("f5dc6df8df2646e1dc51bd0a2a26fe715da38a00f16869fb9780f75936313b3f")

prepare() {
    mkdir data
    bsdtar -x -f data.tar.zst -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
}

