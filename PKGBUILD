# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
_pkgorg=camunda
_pkgname=$_pkgorg-modeler
pkgname=$_pkgname-bin
pkgver=4.8.1
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN, DMN and Forms based on bpmn.io"
arch=('x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('MIT')
depends=('xdg-utils' 'gtk3' 'nss')
install=$_pkgname.install
source=(
    "https://github.com/$_pkgorg/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64.tar.gz"
    "$_pkgname.install")
b2sums=('7ee38e4608f0fae6e4e322b4f30955176e4cb5ade111d1db1cbeda2a066f45427af2aff6a878c286d1dc47690531bae3e7b5cdf9c2abbc975882421a6beb7d78'
        '67491c423c4513c78a01c47cffd0e28287a18913fd7c7b39278d0eeba6203432a84f5db221e9d3c2e755b42fa9a5063c246644c07dcaedc0b0c3f0af2777d604')

package() {
    install -d $pkgdir/opt/$_pkgname
    cp -R $srcdir/$_pkgname-$pkgver-linux-x64/* $pkgdir/opt/$_pkgname
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
}
