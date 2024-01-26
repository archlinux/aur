# Contributor: leepesjee <lpeschier at xs4all dot nl>
pkgname=('python-fitparse-git')
_pkgbase="python-fitparse"
pkgver=v1.2.0.r27.9bd14c4
pkgrel=1
pkgdesc="A Python library to parse ANT/Garmin .FIT files"
arch=('any')
url="https://github.com/dtcooper/python-fitparse"
license=('custom')
makedepends=('git' 'python-setuptools')
source=('python-fitparse::git+https://github.com/dtcooper/python-fitparse')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgbase
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_pkgbase
    python setup.py build
}

package_python-fitparse-git() {
    depends=(python)
    cd $srcdir/$_pkgbase
    python setup.py install --root=$pkgdir/ --optimize=1 --skip-build
    install -Dm644 $srcdir/$_pkgbase/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
