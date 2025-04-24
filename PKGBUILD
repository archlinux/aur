#Maintainer: ZorinArch < zorinarch at protonmail dot com >

_pkgname=crystal-dock
pkgname=${_pkgname}-bin
pkgver=2.12
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

sha256sums_x86_64=("35d99a0e31153c9b60f57f5b1d00741d2f8e5dc6876f799d28b1afeff2c3ee8e792aeeeb0c5183ebb95bcd21f66a983308142c9e2a71da1338284bc7082156f8")

prepare() {
    mkdir data
    bsdtar -x -f data.tar.zst -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
}

