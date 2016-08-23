# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python2-cmscommon-git
pkgver=r40.0df34ab
pkgrel=1
pkgdesc="CMS common module"
arch=('any')
url="https://github.com/algorithm-ninja/cmscommon"
license=('AGPL3')
depends=('python2')
provides=('python2-cmscommon')
options=(!emptydirs)
source=("git+https://github.com/algorithm-ninja/cmscommon.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/cmscommon"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/cmscommon"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
