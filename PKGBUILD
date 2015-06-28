# Maintainer : sumt <sumt at sci dot fi>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>

pkgname=undervolt
pkgver=0.4
pkgrel=1
pkgdesc="A program to undervolt AMD 14h Family processors (E350 at least)."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/undervolt/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('c8e9306edbcf41551a63153cab1d8c8432ee305a4ec7961c3cd5101421cddf4c')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m 775 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
