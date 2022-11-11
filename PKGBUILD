# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-jupyterlab-spellchecker'
_name=${pkgname#python-}
pkgver='0.7.2'
pkgrel=1
pkgdesc="A spell checker for JupyterLab."
url="https://pypi.org/project/${_name}/"
depends=('jupyter-server')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e13732cf5a277d40cd1a25eaa9264c13b67a4231e4bd90695722ddf6eebf6ab1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
