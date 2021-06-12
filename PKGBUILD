# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-mypy-ls
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=2
pkgdesc='Mypy plugin for the Python LSP Server.'
url='https://github.com/Richardk2n/mypy-ls'
arch=('any')
license=('MIT')
depends=('python-lsp-server' 'mypy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/Richardk2n/mypy-ls/master/LICENSE")

build() {
	cd $_name-$pkgver
	python setup.py build
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd $_name-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha256sums=('b1071dd451d44d4fdcbc6112689d5b7c5e5d6804370a2a7b5e2e67cc0fa5affb'
            '91617fa80085a3c75ffc9070b831012595be53fd9b11f381b4c1ab9d91584149')
