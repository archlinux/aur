# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
pkgver=0.3.9
pkgrel=1
pkgdesc='OnionCat is a VPN-adapter, which uses Tor or I2P as its transport.'
arch=('i686' 'x86_64')
url='https://www.onioncat.org/'
license=('GPL3')
depends=('tor' 'net-tools')
source=("https://www.cypherpunk.at/ocat/download/Source/current/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('98678E06063007E4A1F0B9C59BD601668E24F29D') # Bernhard R. Fischer (Eagle) <bf@abenteuerland.at>

sha512sums=('0b036e4de92877c5e15288a736217bec6e59fccebe6e13063200b13e7d0e80dcfa38ccf36cf9507cbdba9c700d47171a1a65ba96fffd25de6fe23bea980d7a15'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
