# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Lara Maia <lara@craft.net.br>

pkgname=gimp-plugin-bimp
pkgver=1.16
pkgrel=1
pkgdesc='Batch Image Manipulation Plugin for GIMP.'
arch=('x86_64' 'i686')
url='http://www.alessandrofrancesconi.it/projects/bimp/'
license=('GPL')
depends=('gimp')
source=(https://github.com/alessandrofrancesconi/${pkgname}/archive/v$pkgver.tar.gz)
md5sums=('5c9664c486889fc28d0a5c43665faa83')


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
