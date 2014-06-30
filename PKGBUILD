# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.6
pkgrel=4
pkgdesc="Libreoffice-based document converter"
depends=('python' 'libreoffice-common')
makedepends=('asciidoc')
arch=('any')
license=('GPL2')
url="http://dag.wieers.com/home-made/unoconv"
source=("$url/$pkgname-$pkgver.tar.gz" python3.patch)
sha256sums=('790e614b8615217ef4588b187f0018b526ec2bb480c6b9b2ffb9b82f48da73d4'
            '424c371768442951e9fa0d5fccd91f78d5da808fecf047b54862e322484f45d7')

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    patch "$pkgdir/usr/bin/unoconv" "$srcdir/python3.patch"
}
