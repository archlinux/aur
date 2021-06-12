# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-mypy-ls
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc='Mypy plugin for the Python LSP Server.'
url='https://github.com/paradoxxxzero/pyls-isort'
arch=('any')
license=('MIT')
depends=('python-lsp-server' 'mypy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha256sums=('b1071dd451d44d4fdcbc6112689d5b7c5e5d6804370a2a7b5e2e67cc0fa5affb')
