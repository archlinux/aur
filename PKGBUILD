# Maintainer: E5ten

pkgname=deb2appimage
pkgver=0.0.3
pkgrel=2
pkgdesc="Build AppImages from deb packages on any distro with simple json configuration"
arch=('x86_64')
url='http://www.simonizor.net'
license=('MIT')
depends=('jq' 'curl')
source=("https://github.com/simoniz0r/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
    cd $srcdir
    bsdtar xvf v$pkgver.tar.gz
}

package() {
    mkdir $pkgdir/opt
    mkdir -p $pkgdir/usr/bin
    mv $srcdir/$pkgname-$pkgver $pkgdir/opt/deb2appimage
    ln -s /opt/deb2appimage/deb2appimage.sh $pkgdir/usr/bin/deb2appimage
}
