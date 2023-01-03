# Maintainer: muttleyxd <mateusz [at] szychowski.it>
pkgname=bflat-bin
pkgver=7.0.1
pkgrel=1
pkgdesc="bflat"
arch=('x86_64')
url="https://github.com/bflattened/bflat"
license=('AGPLv3')
depends=('glibc' 'zlib')
provides=('bflat')
conflicts=('bflat')
options=(!strip)
source=("https://github.com/bflattened/bflat/releases/download/v$pkgver/bflat-$pkgver-linux-glibc-x64.tar.gz")
sha256sums=('9bb567b469f742bf091ccfca2bd4fd53fb529685ba7d1b4e6312c046e0350b8b')

package() 
{
    mkdir -p "$pkgdir/opt/bflat"
    cp -r "$srcdir"/* "$pkgdir/opt/bflat"
    mkdir -p "$pkgdir/usr/bin"
    cd "$pkgdir/usr/bin"
    ln -s /opt/bflat/bflat bflat
}
