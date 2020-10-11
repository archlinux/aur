# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=loko
pkgver=0.6.0
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("AGPL3")
depends=("chez-scheme" "akku")
options=(!strip)
source=("https://scheme.fail/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('b387ef60027b4eeaca30f125db47c56d')

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
