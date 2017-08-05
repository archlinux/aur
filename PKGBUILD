# Maintainer: Niklas <dev@n1klas.net>
pkgbase=python-semanticversion
pkgname=('python-semanticversion' 'python2-semanticversion')
_name=semantic_version
pkgver=2.6.0
pkgrel=2
pkgdesc="A library implementing the 'SemVer' scheme"
arch=(any)
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("2a4328680073e9b243667b201119772aefc5fc63ae32398d6afafff07c4f54c0")

prepare() {
	cp -a $_name-$pkgver{,-python2}
}

package_python-semanticversion() {
	depends=('python')
	provides=('python-semanticversion')

	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-semanticversion/LICENSE"
}

package_python2-semanticversion() {
	depends=('python2')
	provides=('python2-semanticversion')

	cd "${srcdir}/${_name}-${pkgver}-python2"
	python2 setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python2-semanticversion/LICENSE"
}
