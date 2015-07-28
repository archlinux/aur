# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Lara Maia <lara@craft.net.br>

pkgname=gimp-plugin-bimp
pkgver=1.15
pkgrel=2
pkgdesc='Batch Image Manipulation Plugin for GIMP.'
arch=('x86_64' 'i686')
url='http://www.alessandrofrancesconi.it/projects/bimp/'
license=('GPL')
depends=('gimp')
source=(https://github.com/alessandrofrancesconi/gimp-plugin-bimp/archive/v$pkgver.tar.gz)
md5sums=('0d2dd1774f8251bda8a44808b417fef1')


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
