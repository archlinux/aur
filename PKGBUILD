# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Niklas <dev@n1klas.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=vo-amrwbenc
pkgver=0.1.3
pkgrel=2
pkgdesc='Library for the VisualOn Adaptive Multi Rate Wideband (AMR-WB) audio encoder'
arch=('x86_64')
url='http://sourceforge.net/projects/opencore-amr/'
license=('APACHE')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/opencore-amr/vo-amrwbenc/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5652b391e0f0e296417b841b02987d3fd33e6c0af342c69542cbb016a71d9d4e')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix='/usr'
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
