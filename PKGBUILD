# Maintainer: muttleyxd <mateusz [at] szychowski.it>
pkgname=bflat-bin
pkgver=8.0.2
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
sha256sums=('03fc2fffc22d6495a37a8a3bdeccad48b09da381af26222c7ee13a11c4b71c07')

package() 
{
    mkdir -p "$pkgdir/opt/bflat"
    cp -r "$srcdir"/* "$pkgdir/opt/bflat"
    mkdir -p "$pkgdir/usr/bin"
    cd "$pkgdir/usr/bin"
    ln -s /opt/bflat/bflat bflat
}
