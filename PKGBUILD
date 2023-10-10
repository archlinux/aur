# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-gtsam
_pkgname=${pkgname:7}
_py=cp39
pkgver=4.2
pkgrel=2
pkgdesc="Georgia Tech Smoothing And Mapping library"
arch=(x86_64)
url="https://pypi.org/project/gtsam"
license=('Simplified BSD license')
makedepends=('python-setuptools'
             'python-pip')
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux2014_x86_64.whl)
sha256sums=('e254e531223c2319194d19e7a267bb5274c22b8f7c7d91ba34ede0ddd9598268')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	python -O -m compileall "${pkgdir}/path/to/module"
}
