#Maintainer: ZorinArch < zorinarch at protonmail dot com >

_pkgname=crystal-dock
pkgname=${_pkgname}-bin
pkgver=2.11
pkgrel=1
pkgdesc="A cool dock (desktop panel) for Linux desktop."
arch=('x86_64')
url='https://github.com/dangvd/crystal-dock'
license=('GPL3')
options=('!strip' 'staticlibs')
depends=(qt6-base wayland layer-shell-qt kwin)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$url/releases/download/v$pkgver/${_pkgname}_${pkgver}-1_amd64.deb")

sha256sums_x86_64=('0bd12367e4474cd39a5c89aa55d1ecc314299ac1620d1a6444b37084bc43506e')

prepare() {
    mkdir data
    bsdtar -x -f data.tar.zst -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
}

