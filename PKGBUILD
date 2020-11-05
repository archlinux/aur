# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>
# Contributor: Ishan Arora <ishanarora@gmail.com>

_name=oct2py
pkgname=python-oct2py
pkgver=5.2.0
pkgrel=1
pkgdesc="Python to GNU Octave bridge."
arch=('any')
url="http://github.com/blink1073/oct2py"
license=('MIT')
depends=('python-scipy' 'python-numpy' 'jupyter-octave_kernel' 'gnuplot')
optdepends=('python-pytest: for test use'
            'python-pandas: for test use'
            'jupyter-nbconvert: for test use'
            'python-sphinx: documentation support'
            'python-sphinx-bootstrap-theme'
            'python-numpydoc: documentation support')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7e7f03724d60745b6ff49760027712a5ae22ed3c67f8d4560ba8a80c2ebdfaf0')


build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}

