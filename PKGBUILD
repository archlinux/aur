# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: JcNils <jcnils at user dot noreply dot github dot com >
# Contributor: Xaryphon <xaryphon at tuta dot io>
pkgname=protonhax
pkgver=1.0.4
_pkgfile=$pkgname-$pkgver
pkgrel=1
pkgdesc="Program to help executing outside programs in proton"
arch=('x86_64')
url="https://github.com/jcnils/protonhax"
license=('BSD')
makedepends=('tcc')
conflicts=("$pkgname-git")
source=("$_pkgfile.tar.gz"::"https://github.com/jcnils/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da4104a16265a4cf482510d41d7c2ad02679ff3f6b70b2a2675958af08f72a49')

build() {
    cd $_pkgfile
    make
}

package() {
    cd $_pkgfile

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -d -m755 $pkgdir/usr/bin
    install -m755 protonhax $pkgdir/usr/bin/protonhax
    install -m755 envload $pkgdir/usr/bin/envload
}
