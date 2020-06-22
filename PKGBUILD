# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=loko
pkgver=0.5.0
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("AGPL3")
depends=("chez-scheme" "akku")
options=(!strip)
source=("https://scheme.fail/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('f690d05f2e5b1030f8bef72a4ce50e36')

build()
{
    cd "$pkgname-$pkgver"
    make
}

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
    make DESTDIR="$pkgdir/" PREFIX="/usr" install-info
}
