# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('db69f2d75603e0e8f72e734854ac445beb60ed38922bc97b7f7a522795ca4c8c')
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