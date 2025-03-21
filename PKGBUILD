# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-bempp-cl
_pyname=bempp-cl
pkgver=0.4.0
pkgrel=1
pkgdesc='A fast Python based just-in-time compiling boundary element library'
arch=('x86_64')
url="https://github.com/bempp/bempp-cl"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-numba' 'python-meshio')
makedepends=('python-setuptools' 'python-pip')
optdepends=('python-plotly'
    'python-matplotlib'
    'python-psutil'
    'python-mpi4py')
provides=('python-bempp')
conflicts=('python-bempp')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/bempp/bempp-cl/archive/v${pkgver}.tar.gz")
sha256sums=('9c4c7bc20aa870d6b74e68698ac2916e87466146c6fac516cbc86237e2631f59')

package() {
	cd "$srcdir/$_pyname-$pkgver"
        python -m pip install --root="$pkgdir" --no-deps .
	cd "$pkgdir"
	install -m0644 -D "$srcdir/$_pyname-$pkgver"/LICENSE usr/share/licenses/$pkgname/LICENSE
	chmod -R a+r usr
}

