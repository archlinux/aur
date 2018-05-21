# Maintainer: Philip Goto <philip.goto@gmail.com>
_pkgname=aiotg
pkgname=python-$_pkgname
pkgver=0.9.9
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/1a/47/c96d67dcd5fe7ca99aa97518d8e908a60e86cd8e3dc7a2552a601e37812d/aiotg-0.9.9.tar.gz")
sha256sums=('e3c9e051d3a1e85274b74e7f3473e99abaef9ed9718b5283f6c6782705a10def')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
