# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python2-itamake-git
pkgver=r77.0148ec9
pkgrel=1
pkgdesc="A stripped down cmsMake which *only* makes, nothing more."
arch=('any')
url="https://github.com/algorithm-ninja/itaMake.git"
license=('AGPL3')
depends=('python2' 'python2-cmscommon')
provides=('python2-itamake')
options=(!emptydirs)
source=("git+https://github.com/algorithm-ninja/itaMake.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/itaMake"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/itaMake"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
