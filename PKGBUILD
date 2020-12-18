# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=loko
pkgver=0.7.0
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("AGPL3")
depends=("chez-scheme" "akku")
options=(!strip)
source=("https://scheme.fail/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('056462de3ad93b18a3d02ebc513bc2d5')

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
