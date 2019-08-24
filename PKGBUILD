# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-bullet
pkgver=2.1.0
pkgrel=1
pkgdesc='Extensive support for Python list prompts formatting and colors.'
arch=('any')
url='https://pypi.org/project/bullet'
license=('MIT')
depends=('python')
_pkgname=${pkgname//python-}
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Mckinsey666/bullet/master/LICENSE")
md5sums=('1e00a4b2ad82cd9fab651c56764706fc'
         'SKIP')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
