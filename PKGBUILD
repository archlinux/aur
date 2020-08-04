# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.3.4
pkgrel=1
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('73d767b3b1e943cf54351160e8e5339ca7f0e08c38ad09d0435c6a80c4cd800a')
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
