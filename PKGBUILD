# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=pkgcacheclean
pkgver=1.8.2
pkgrel=2
pkgdesc="Application to clean the pacman cache"
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7')
url=('https://bbs.archlinux.org/viewtopic.php?pid=841774')
license=('GPL')
depends=('pacman>=4.1')
source=($pkgname.c)
md5sums=('d79fac7e27381249774fc8e6f15d7f2e')

build()
{
    cd "$srcdir"
    gcc -o $pkgname $CFLAGS -DVERSION=\"$pkgver\" -DCARCH=\"$CARCH\" \
        $pkgname.c -lalpm $LDFLAGS
}

package()
{
    install -m 755 -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
