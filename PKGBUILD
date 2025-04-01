# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-bempp-cl
_pyname=bempp-cl
pkgver=0.4.2
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
sha256sums=('13c1f72cbeba22a18dc93e3ac7d87378f8a2ba01e42ba837be987de98dcf9240')

package() {
	cd "$srcdir/$_pyname-$pkgver"
        python -m pip install --root="$pkgdir" --no-deps .
	cd "$pkgdir"
	install -m0644 -D "$srcdir/$_pyname-$pkgver"/LICENSE usr/share/licenses/$pkgname/LICENSE
	chmod -R a+r usr
}

