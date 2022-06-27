# Maintainer: muttleyxd <mateusz [at] szychowski.it>
pkgname=simpl
pkgver=3.3.8
pkgrel=1
pkgdesc="Synchronous Interprocess Messaging Project for LINUX (SIMPL)"
arch=('x86_64')
url="https://sourceforge.net/projects/simpl"
license=('LGPL2')
depends=()
provides=('simpl')
conflicts=('simpl')
source=("https://master.dl.sourceforge.net/project/simpl/simpl/simpl%20v$pkgver/simpl-$pkgver.tar.gz"
        "0001-compilation-fix.patch")
sha256sums=('fd89141eea08821ea68f21fc6b66328547b73f332ac0239bda61b9b9c922dac1'
            'c375a47114b92297208c689887d7cf5914f1bea8014f745f43ad100997b53ea6')

prepare()
{
    cd "$srcdir/simpl-$pkgver"
    patch -p1 < "../0001-compilation-fix.patch"
}

build()
{
    cd "$srcdir/simpl-$pkgver"
    make
}

package()
{
    mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib"
    cp -R "$srcdir/simpl-$pkgver/include" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/lib" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/fclogger/include" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/fclogger/lib" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/surrogates/tclSurrogate/include" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/surrogates/tclSurrogate/lib" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/simplUtils/include" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/simplUtils/lib" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/simplipc/include" "$pkgdir/usr/"
    cp -R "$srcdir/simpl-$pkgver/simplipc/lib" "$pkgdir/usr/"

    rmdir "$pkgdir/usr/lib/i386"
}
