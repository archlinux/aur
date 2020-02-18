# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.3.1
pkgrel=2
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a19baa9e776f72c1cbdabd75d908f68819f1678433fe31b91fed5572551f4ef6')
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
