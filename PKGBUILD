# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-pyls-isort
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=3
pkgdesc='Isort plugin for python-language-server'
url='https://github.com/paradoxxxzero/pyls-isort'
arch=('any')
license=('MIT')
depends=('python-lsp-server' 'python-isort')
makedepends=('python-setuptools')
conflicts=(python-lsp-isort)
replaces=(python-lsp-isort)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
	cd $_name-$pkgver
	python setup.py build
}

package() {
	cd $_name-$pkgver
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('9861494cb118c309b06709b2aa1361e7')
