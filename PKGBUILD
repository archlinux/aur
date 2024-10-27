#Maintainer: ZorinArch < zorinarch at protonmail dot com >

_pkgname=crystal-dock
pkgname=${_pkgname}-bin
pkgver=2.7
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

sha256sums_x86_64=('d17fe863b25616c7ec6ed7d05d8c5bcdf2f7047bda77dc77369ddc0d44688966')

prepare() {
    mkdir data
    bsdtar -x -f data.tar.zst -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
}

