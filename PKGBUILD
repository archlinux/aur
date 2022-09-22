# Maintainer: Lulu Cathrinus Grimalkin <erkin@sdf.org>
pkgname=loko
pkgver=0.11.0
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("AGPL3")
depends=("chez-scheme" "akku")
options=(!strip)
source=("https://scheme.fail/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('43f3b617cb193f71e6cf21e75ab1bf1e893e34e1b189637bbe9f7e7c7a205abc')

build()
{
    cd "$pkgname-$pkgver"
    PREFIX="/usr" make
}

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install-all
}
