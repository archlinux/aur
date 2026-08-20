# Maintainer: cafreo 

_pkgname=joplin
pkgname=${_pkgname}-beta-bin
pkgver=3.7.12
pkgrel=2
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

sha256sums_x86_64=('7bdf51253befa268f7ce4c349c337d5f635a1f6c8ca3512a3961fdfa66b1cbbc')

