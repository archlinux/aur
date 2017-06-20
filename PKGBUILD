# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
pkgver=0.2.2.r578
_ver=${pkgver%%.r*}
pkgrel=1
pkgdesc='An IP-Transparent Tor Hidden Service Connector'
arch=('i686' 'x86_64')
url='https://www.onioncat.org/'
license=('GPL3')
depends=('tor' 'net-tools')
source=("https://www.cypherpunk.at/ocat/download/Source/${_ver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('98678E06063007E4A1F0B9C59BD601668E24F29D') # Bernhard R. Fischer (Eagle) <bf@abenteuerland.at>

sha512sums=('a6638a582e321ce1969ac70d73c52b828e1dfb0ca25ee33a18c811d5a972603bff8ff510a1b833259ea4184843dc6d1e2c2892809ca437180d79e0bbd4a79bb6'
            'SKIP')
whirlpoolsums=('0eaca1e3af722db8fbd197e7403427d51bc37e31c0502f48452a4674d7cfe1c2c7952fec9c4a48b32f8319bdfede1fd569a9d014ff9c5a2ceefea5b1f039e697'
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
