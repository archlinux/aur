pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.4'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-setuptools' 'python-fastentrypoints')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/13/b7/3788f77ade8353947971faf3baf414a519f7b12f83dd59ca46219b5dc77c/dirlog-${pkgver}.tar.gz")
md5sums=('f17fec93271677c7e187cfdd5c826507')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
