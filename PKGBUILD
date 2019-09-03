# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=0.5.0
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
arch=('any')
url='https://pypi.org/project/jupyterlab-code-formatter'
license=('MIT')
depends=(jupyterlab)
optdepends=(autopep8 yapf python-isort python-black)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ryantam626/jupyterlab_code_formatter/master/LICENSE")
md5sums=('22cd6bffc530d5d5d7e876a760dfaf61'
         'SKIP')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
