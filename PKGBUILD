# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-mypy-ls
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
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

sha256sums=('e3f1b5d76efc1136440c10dc61fe601f75f753525632898d0ca35fdea1388f76'
            '91617fa80085a3c75ffc9070b831012595be53fd9b11f381b4c1ab9d91584149')
