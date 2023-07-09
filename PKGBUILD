# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=2.10
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
licence=("GPL3")
depends=('python-magic' 'xapp' 'python-xapp' 'python-gobject' 'python-setproctitle')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('466a199609eed5c8cab55b661c90857be01c3e98ee0027321c7bd9d156a13a7b')

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
