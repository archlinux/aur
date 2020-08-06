# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.3.5
pkgrel=1
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8440ffe49c4ae81a8df57c1ae1eb4b6bfa7acb830099bfb3e305b383005cc128')
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
