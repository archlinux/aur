# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=3.5
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
license=("GPL3")
depends=('python-magic' 'xapp' 'python-xapp' 'python-gobject' 'python-setproctitle' 'python-unidecode')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('84d449535553f5f1857812d88c70252730473c8f85760e80be1381d53290028c')

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
