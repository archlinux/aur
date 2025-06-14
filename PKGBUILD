# Maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>

_pkgname=joplin
pkgname=${_pkgname}-bin
pkgver=3.3.13
pkgrel=1
pkgdesc="Note Taking App. Debian Package."
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

md5sums_x86_64=('8ecb54c45b3e1c054f4250ae0060720a')
