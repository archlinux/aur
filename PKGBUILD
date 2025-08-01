# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=3.8
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
license=("GPL3")
depends=('xapp' 'python-xapp' 'python-gobject' 'python-setproctitle' 'python-unidecode')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d0db4a698dad1e574970fbcfe2456e6f12d1ac0b78a22bb6aab4e62f748a6b39')

prepare()
{
    sed -i "s/__DEB_VERSION__/${pkgver}/" "$srcdir"/"$pkgname"-"$pkgver"/usr/lib/bulky/bulky.py
}

build()
{
    cd "$srcdir"/"$pkgname"-"$pkgver"
    make
}

package()
{   
    cd "$srcdir"/"$pkgname"-"$pkgver"
    cp -r usr "$pkgdir"
}
