#Maintainer: Machina <machinax@protonmail.com>
pkgname='python-name-that-hash'
_module='name-that-hash'
pkgver=1.6.0
pkgrel=4
pkgdesc="The Modern Hash Identifcation System"
url="https://github.com/HashPals/Name-That-Hash"
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-rich')
license=('(L)GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
md5sums=('d4e70b2bbc2fedc7f591b9047fd6641d')

build() 
{
	cd "$_module-$pkgver"
	python setup.py build
}

package() 
{
	cd "$_module-$pkgver"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps loguru
	python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1 --skip-build
}
