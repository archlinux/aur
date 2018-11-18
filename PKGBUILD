# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
pkgver=0.2.2.r578
pkgrel=2
pkgdesc='An IP-Transparent Tor Hidden Service Connector'
arch=('i686' 'x86_64')
url='https://www.onioncat.org/'
license=('GPL3')
depends=('tor' 'net-tools')
source=("https://github.com/raffael-sfm/onioncat/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('98678E06063007E4A1F0B9C59BD601668E24F29D') # Bernhard R. Fischer (Eagle) <bf@abenteuerland.at>

sha512sums=('a6638a582e321ce1969ac70d73c52b828e1dfb0ca25ee33a18c811d5a972603bff8ff510a1b833259ea4184843dc6d1e2c2892809ca437180d79e0bbd4a79bb6'
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
