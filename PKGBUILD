# Maintainer: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-testsuite'
pkgver='22.0.0'
pkgrel=1
pkgdesc="Generic Testsuite Driver in Python"

arch=('any')
url="https://github.com/AdaCore/e3-testsuite"
license=('GPL3')

depends=('python-e3-core')
makedepends=('python-setuptools')

_name='e3-testsuite'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('73fde0acfb6c71e5a444e24c6744235b07ac25182b5cd8fc683924e79c4267655d1ef801d45e6cefb122ce7768f255719e55d050cfca514c2290824bdc856dba')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
