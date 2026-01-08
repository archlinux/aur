# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=bulky
pkgver=4.2
pkgrel=1
pkgdesc="Bulk File Renamer"
arch=("i686" "x86_64")
url="https://github.com/linuxmint/bulky"
license=("GPL3")
depends=('xapp' 'xapp-symbolic-icons' 'python-xapp' 'python-gobject' 'python-setproctitle' 'python-unidecode')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b4c3c4e8287279d56e900dc0788ccb35cfc01d278a4029db9c7ead514dddcbcc')

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
