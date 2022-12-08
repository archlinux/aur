# Maintainer: Lulu Cathrinus Grimalkin <erkin@sdf.org>
pkgname=loko
pkgver=0.12.0
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("AGPL3")
depends=("chez-scheme" "akku")
options=(!strip)
source=("https://scheme.fail/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3bd0c65282496457eff296ccda86fb90903f93ad76dee285e2eee6fd70f5b300')

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
