# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-bullet
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=3
pkgdesc='Extensive support for Python list prompts formatting and colors.'
arch=('any')
url='https://pypi.org/project/bullet'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Mckinsey666/bullet/master/LICENSE")
md5sums=('1e00a4b2ad82cd9fab651c56764706fc'
         'SKIP')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
