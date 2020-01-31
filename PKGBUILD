# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=python-togglpy
_pypiname=TogglPy
pkgver=0.1.1
pkgrel=4
pkgdesc='TogglPy is a non-cluttered, easily understood and implemented python library for interacting with the Toggl API.'
arch=('any')
url='https://github.com/matthewdowney/TogglPy'
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('716bcb71cced0172285dae226f91c6e0')
sha256sums=('fda2b4d2508a95f5ec3e86128af8ba0006686b69423824bc4967445776f69811')

prepare() {
	cd "${_pypiname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pypiname}-${pkgver}"

	python setup.py install \
		--optimize=1 \
		--prefix=/usr \
		--root=${pkgdir} \
		--skip-build

	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pypiname}/"
}
