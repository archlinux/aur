# Maintainer: Mikhail Velichko <efklid at gnail dot com >
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Maz <m47h4r at gmail dot com>
# Contributor: Molyuu <zhangjtroger at gmail dot com>

pkgname=nekoray-bin
pkgver=4.3.5
_releasedate=2025-05-16
pkgrel=1
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box)"
arch=('x86_64')
url="https://github.com/Mahdi-zarei/nekoray/"
license=('GPL 3.0')
groups=()
depends=('desktop-file-utils' )
provides=('nekobox')
conflicts=('nekoray-git' 'nekoray')

source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/nekoray-${pkgver}-${_releasedate}-debian-x64.deb"
  "nekoray.sh"
)

sha256sums=(
    '5683ea7e81fb0e4a3c2470775eb14e59bb991ea44d16988a8fa5213f95c977a3'
    'dbff73d83aebc9ce438b172a66bb787392a27f092b444ccd99cec18e1e91c914'
)
install=${pkgname}.install

prepare() {
    tar -xf data.tar.zst
}
package() {
    cp -dr --no-preserve=ownership opt "$pkgdir"/
    mkdir -p "${pkgdir}"/usr/bin/
    install -Dm755 ./nekoray.sh ${pkgdir}/usr/bin/nekoray
}



