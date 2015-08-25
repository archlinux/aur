# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: jck <jck@archlinux.us>

pkgname=avbin7
pkgver=7.0.0
pkgrel=1
pkgdesc="Cross-platform media decoding library"
arch=('i686' 'x86_64')
url="http://avbin.github.com"
license=('LGPL')
#install=avbin.install
[  "$CARCH" = i686 ] && _arch=32
[  "$CARCH" = x86_64 ] && _arch=64
source=(https://github.com/downloads/AVbin/AVbin/avbin-linux-x86-$_arch-7.tar.gz)
[  "$CARCH" = i686 ] && md5sums=('28038f3dba33da284972463216e1da0d')
[  "$CARCH" = x86_64 ] && md5sums=('4dff910202080e706a3db311e1e42094')

package() {
    _avlib=libavbin.so.7
    mkdir $pkgdir/usr
    mkdir $pkgdir/usr/lib
    cp $srcdir/avbin-linux-x86-$_arch-7/$_avlib $pkgdir/usr/lib/ || return 1
    cd $pkgdir/usr/lib
    ln -sf $_avlib libavbin.so || return 1
    chmod a+rx $_avlib || return 1
}
