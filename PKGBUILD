# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.5
pkgrel=1
pkgdesc="Libreoffice-based document converter"
depends=('python2' 'java-runtime' 'libreoffice-common')
makedepends=('asciidoc')
arch=('any')
license=('GPL2')
url="http://dag.wieers.com/home-made/unoconv"
source=($pkgname-$pkgver.zip::https://github.com/dagwieers/unoconv/zipball/$pkgname-$pkgver)
sha256sums=('5beef3cb723efff188ceba09c63c31ffaa010c154e1961874c7170bf304e3b08')

build() {
    cd dagwieers-$pkgname-???????
    sed -i '1s/python$/&2/' unoconv
}

package() {
    cd dagwieers-$pkgname-???????
    make DESTDIR="$pkgdir" install
}
