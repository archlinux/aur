# Maintainer: ZorinArch < zorinarch at proton dot me >

_pkgname=crystal-dock
pkgname=${_pkgname}-bin
pkgver=2.14
pkgrel=2
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

sha256sums_x86_64=("ce825bdfd5b0b6efd53783275a99d79b981e5a7d6d9e2bc07b8c2f8614d2d134")

prepare() {
    mkdir data
    bsdtar -x -f data.tar.zst -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
}

