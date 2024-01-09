# Maintainer: muttleyxd <mateusz [at] szychowski.it>
pkgname=bflat-bin
pkgver=8.0.1
pkgrel=1
pkgdesc="Bflat C# compiler"
arch=('x86_64')
url="https://github.com/bflattened/bflat"
license=('AGPLv3')
depends=('glibc' 'zlib')
provides=('bflat')
conflicts=('bflat')
options=(!strip)
source=("https://github.com/bflattened/bflat/releases/download/v$pkgver/bflat-$pkgver-linux-glibc-x64.tar.gz")
sha256sums=('2f8e8e07cc5ca428c71cfa1f1771d2bf59ea31c6d40ae335b4d6d06f24cc50cb')

package() 
{
    mkdir -p "$pkgdir/opt/bflat"
    cp -r "$srcdir"/* "$pkgdir/opt/bflat"
    mkdir -p "$pkgdir/usr/bin"
    cd "$pkgdir/usr/bin"
    ln -s /opt/bflat/bflat bflat
}
