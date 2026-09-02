# Maintainer: cafreo 

_pkgname=joplin
pkgname=${_pkgname}-beta-bin
pkgver=3.7.14
pkgrel=1
pkgdesc="A note taking and to-do application with synchronization capabilities (beta binary version)"
arch=('x86_64')
url='https://github.com/laurent22/joplin'
license=('AGPL3')
options=('!debug')
provides=("${_pkgname}")
conflicts=("joplin-desktop" "joplin" "joplin-appimage" "joplin-beta" "joplin-electron" "joplin-beta-appimage")

source_x86_64=("${pkgname}-${pkgver}.deb"::"$url/releases/download/v$pkgver/${_pkgname}-${pkgver}.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
    ln -s "/opt/Joplin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('1e74be13f3e9d3ffadb2164e4b7a069417808c1530665817604c302926abb5bd')

