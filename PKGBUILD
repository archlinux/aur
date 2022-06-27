# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=2.3
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
licence=("GPL3")
depends=('python-magic' 'xapp' 'python-xapp' 'python-gobject' 'python-setproctitle')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6fbd2e622151f108718e3ba3aaf918994897cd2eb52d147cb7b4931b5d8fa653')

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
