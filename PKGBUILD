# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.3.3
pkgrel=1
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('304cf46a89256ba1106ee4ff08608d193cef21daae263da5519aa25fd93b77d2')
arch=('any')

build() {
    cd $srcdir/${_name}-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/${_name}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
