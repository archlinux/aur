# Maintainer: Xaryphon <xaryphon at tuta dot io>
pkgname=protonhax
pkgver=1.0.1
pkgrel=1
pkgdesc="Program to help executing outside programs in proton"
arch=('x86_64')
url="https://gitlab.com/xaryphon/protonhax"
license=('BSD')
makedepends=('tcc')
source=('git+https://gitlab.com/xaryphon/protonhax.git')
md5sums=('SKIP')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -d -m755 $pkgdir/usr/bin
    install -m755 protonhax $pkgdir/usr/bin/protonhax
    install -m755 envload $pkgdir/usr/bin/envload
}
