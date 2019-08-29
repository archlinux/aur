# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
pkgver=0.2.8
pkgrel=1
pkgdesc='OnionCat is a VPN-adapter, which uses Tor or I2P as its transport.'
arch=('i686' 'x86_64')
url='https://www.onioncat.org/'
license=('GPL3')
depends=('tor' 'net-tools')
source=("https://www.cypherpunk.at/ocat/download/Source/current/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('98678E06063007E4A1F0B9C59BD601668E24F29D') # Bernhard R. Fischer (Eagle) <bf@abenteuerland.at>

sha512sums=('4bf4e5557c8fc3d50ffa5ce2e850479d6174bd6e16a716c0eca28461ca8cd88f798bdd0d0ba853f78b93ef378f00529556b26e1ddd9a2761c741fc3737296417'
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
