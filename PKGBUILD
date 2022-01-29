# Maintainer: Fredrick Brennan <copypaste@kittens.ph>

pkgname=bdf2psf-pre0.2
pkgver=2005
pkgrel=1
pkgdesc='Bitmap font conversion utility with a very long history (pre-2006 source)'
depends=('perl')
provides=('bdf2psf')
conflicts=('bdf2psf')
arch=('any')
license=('GPL2')
source=('bdf2psf.tar.zstd')
sha512sums=('b267abce37bcb23f9f78b79921ded8ea12e85cbb9b44d6e4b4fa0fba979ccea0bb9bba97cc405214f37938fdb1292feedb9fac6108413f2dc5f345563c47999a')

build() {
    set -x
    cd $srcdir
    which bat && bat no_argv.patch || cat no_argv.patch
    patch < no_argv.patch
    set +x
}

package() {
    set -x
    chmod oga+x $srcdir/bdf2psf
    mkdir -p $pkgdir/usr/bin/ 
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -t $pkgdir/usr/bin/ $srcdir/bdf2psf
    install -t $pkgdir/usr/share/licenses/$pkgname/ $srcdir/SOURCE.md
    set +x
}
