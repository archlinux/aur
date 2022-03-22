# Maintainer: JcNils <jcnils at user dot noreply dot github dot com >
# Contributor: Xaryphon <xaryphon at tuta dot io>
pkgname=protonhax
pkgver=1.0.4
pkgrel=1
pkgdesc="Program to help executing outside programs in proton"
arch=('x86_64')
url="https://github.com/jcnils/protonhax"
license=('BSD')
makedepends=('tcc')
source=('git+https://github.com/jcnils/protonhax.git')
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
