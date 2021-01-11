# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Lara Maia <lara@craft.net.br>

_pkgname=bimp
pkgname=gimp-plugin-bimp
pkgver=2.5
pkgrel=1
pkgdesc='Batch Image Manipulation Plugin for GIMP'
arch=('x86_64' 'i686')
url='http://www.alessandrofrancesconi.it/projects/bimp/'
license=('GPL')
depends=('gimp')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/alessandrofrancesconi/${pkgname}/archive/v$pkgver.tar.gz)
md5sums=('773eadcae1816255733fef5d754e0c0f')


build() {
    cd $pkgname-$pkgver

    make
}

package() {
    cd $pkgname-$pkgver

    mkdir -p "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
    cp ./bin/bimp "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
    cp -Rf ./bimp-locale/  "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
}
