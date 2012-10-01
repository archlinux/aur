# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.6
pkgrel=2
pkgdesc="Libreoffice-based document converter"
depends=('python2' 'libreoffice-common')
makedepends=('asciidoc')
arch=('any')
license=('GPL2')
url="http://dag.wieers.com/home-made/unoconv"
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('790e614b8615217ef4588b187f0018b526ec2bb480c6b9b2ffb9b82f48da73d4')

build() {
    cd $pkgname-$pkgver
    sed -i '1s/python$/&2/' unoconv
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
