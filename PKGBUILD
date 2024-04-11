# Maintainer: JcNils <jcnils at user dot noreply dot github dot com >
# Contributor: Xaryphon <xaryphon at tuta dot io>
_pkgname=protonhax
pkgname=$_pkgname-git
pkgver=1.0.5
pkgrel=1
pkgdesc="Program to help executing outside programs in proton"
arch=('x86_64')
url="https://github.com/jcnils/protonhax"
license=('BSD')
makedepends=('git')
source=('git+https://github.com/jcnils/protonhax.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $_pkgname

    install -d -m755 $pkgdir/usr/share/licenses/$_pkgname
    install -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE

    install -d -m755 $pkgdir/usr/bin
    install -m755 protonhax $pkgdir/usr/bin/protonhax
}
