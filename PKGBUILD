# Maintainer: Rodrigo Farias <rodrigofarias77 at gmail dot com>

pkgname=unrpyc-git
pkgver=1.1.6+1+g8edfc27
pkgrel=1
pkgdesc="A ren'py script decompiler"
arch=('any')
url='https://github.com/CensoredUsername/unrpyc'
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=("git+$url")
md5sums=('SKIP')

repo=unrpyc

pkgver () {
    cd "$srcdir/$repo"
    git describe --long --tags | sed 's/^v//; s/-/+/g'
}

prepare () {
    cd "$srcdir/$repo"
    sed -i "/scripts=/s/]/, 'deobfuscate.py']/" setup.py
}

package() {
    cd "$srcdir/$repo"
    python2 setup.py install --root="$pkgdir"
}
