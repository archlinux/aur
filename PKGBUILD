# Maintainer: Igor Yanchenko <yanchenko.igor@gmail.com>
_pkgname=cdiff
pkgname=python-cdiff
pkgver=1.0
pkgrel=1
pkgdesc="Term based tool to view colored, incremental diff in a Git/Mercurial/Svn workspace or from stdin, with side by side and auto pager support."
arch=("any")
url="https://github.com/ymattw/cdiff"
license=('MIT')
depends=('less' 'python>=2.5')
source=("https://files.pythonhosted.org/packages/69/6c/301876940e760a8b46c1caacf08c298f511f517c70eec32e43f38e9cc6f5/cdiff-1.0.tar.gz")
md5sums=('c70ed1abbd9d999bfe4fd83e05ed4092')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
