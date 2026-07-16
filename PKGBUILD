# Maintainer: cafreo 

_pkgname=joplin
pkgname=${_pkgname}-beta-bin
pkgver=3.7.6
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

sha256sums_x86_64=('431ec47aa115e54243d9d594eabf128b51daeda5dedb16a9cb82ca75b40b99a8')

