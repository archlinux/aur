# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-arsenic
_name="${pkgname#python-}"
pkgver=21.8
pkgrel=1
pkgdesc='Asynchronous WebDriver client'
arch=('any')
url='https://github.com/HENNGE/arsenic'
license=('Apache')
depends=(
	'python-aiohttp'
	'python-attrs'
	'python-structlog')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1ac2d29ff447b648f870ce241660d0584d847f07f8fd6f00117e8aba0594e927')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
