# Maintainer: Ekin Dursun <ekindursun@gmail.com>
_name='htmlmin'
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=0.1.12
pkgrel=1
pkgdesc="A configurable HTML minifier with safety features"
arch=('any')
url="https://htmlmin.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('a8903c90055b3fd685e3a1ce1ffdd7ac')

package_python-htmlmin() {
	depends=('python')

	cd "${_name}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-${_name}/LICENSE"
}

package_python2-htmlmin() {
	depends=('python2')

	cd "${_name}-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    mv "$pkgdir/usr/bin/htmlmin" "$pkgdir/usr/bin/htmlmin2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python2-${_name}/LICENSE"
}
