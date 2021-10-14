# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-gtsam
_pkgname=${pkgname:7}
_py=cp39
pkgver=4.1.1
pkgrel=1
pkgdesc="Georgia Tech Smoothing And Mapping library"
arch=(any)
url="https://pypi.org/project/gtsam"
license=('Simplified BSD license')
makedepends=('python-setuptools'
             'python-pip')
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver.dev2-$_py-${_py}-manylinux2014_x86_64.whl)
sha256sums=('4229e4d19ef6eb12ae97006a2e88b2c721099199430db57c379a063a2ee02d54')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	python -O -m compileall "${pkgdir}/path/to/module"
}
