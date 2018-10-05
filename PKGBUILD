# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=('python-picos-git')
pkgname=('python-picos-git' 'python2-picos-git')
pkgver=1.1.3.r0.g9abcd64
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers. Git version.'
arch=('any')
url='https://gitlab.com/picos-api/picos'
license=('GPL3')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("picos::git+https://gitlab.com/picos-api/picos.git")

pkgver() {
	cd picos
	./version.py --aur
}

package_python-picos-git() {
	depends=('python-six' 'python-numpy' 'python-cvxopt')
	conflicts=('python-picos')

	cd picos
	python setup.py install --root=${pkgdir}
}

package_python2-picos-git() {
	depends=('python2-six' 'python2-numpy' 'python2-cvxopt')
	conflicts=('python2-picos')

	cd picos
	python2 setup.py install --root=${pkgdir}
}

md5sums=('SKIP')
